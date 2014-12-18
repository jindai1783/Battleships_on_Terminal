require_relative 'board.rb'
require_relative 'fleet.rb'

class Game

  attr_reader :board
  def get_name
    puts 'Please enter the name for player 1'
    @player1 = gets.chomp
    puts 'Please enter the name for player 2'
    @player2 = gets.chomp
  end

  def set_board
    puts 'Please enter the size of the board'
    size = gets.chomp.to_i
    @board1 = Board.new(size)
    @board2 = Board.new(size)
  end

  def crash_message
    raise "\e[31mSorry, your ships have crashed, you lose.\e[0m"
  end

  def rock_message
    raise "\e[31mSorry, your ship hit the rocks and sunk, don't go too far.\e[0m"
  end

  def set_fleet(player, ship_size, ship_name, board)
    puts "#{player}, please set your #{ship_name} head y value"
    ax = gets.chomp.to_i
    puts "#{player}, please set your #{ship_name} head x value"
    ay = gets.chomp.to_i
    puts "#{player}, please set your #{ship_name} orientation (N, E, S or W)"
    ao = gets.chomp
    case ao
    when 'N'
      for i in 0..ship_size - 1
        rock_message if (ax + 1) < 0 || (ax + 1) > board.size || ay < 0 || ay > board.size
        crash_message if board.check_element?(ax + i, ay)
        board.register_ship(ax + i, ay)
      end
    when 'E'
      for i in 0..ship_size - 1
        rock_message if ax < 0 || ax > board.size || (ay - i) < 0 || (ay - i) > board.size
        crash_message if board.check_element?(ax, ay - i)
        board.register_ship(ax, ay - i)
      end
    when 'S'
      for i in 0..ship_size - 1
        rock_message if (ax - i) < 0 || (ax - i) > board.size || ay < 0 || ay > board.size
        crash_message if board.check_element?(ax - i, ay)
        board.register_ship(ax - i, ay)
      end
    when 'W'
      for i in 0..ship_size - 1
        rock_message if ax < 0 || ax > board.size || (ay + i) < 0 || (ay + i) > board.size
        crash_message if board.check_element?(ax, ay + i)
        board.register_ship(ax, ay + i)
      end
    else
    end
  end

  def stage_1
    puts '~~~~~GAME START!!!~~~~~'
    get_name
    set_board
    fleet1 = Fleet.new
    fleet1.fleet.each do |ship_name, ship_size|
      set_fleet(@player1, ship_size, ship_name, @board1)
      puts "\e[34m-----#{@player1}'s territory-----\e[0m"
      @board1.print_ship
    end

    puts "It's #{@player2}'s turn to set fleet."

    fleet2 = Fleet.new
    fleet2.fleet.each do |ship_name, ship_size|
      set_fleet(@player2, ship_size, ship_name, @board2)
      puts "\e[34m-----#{@player2}'s territory-----\e[0m"
      @board2.print_ship
    end

    puts "Both of you have finished your settings."
    puts "The battle shall start now"
  end

  def stage_2
    while true
      puts "It's #{@player1}'s turn to hit"
      puts "Please enter y value"
      x = gets.chomp.to_i
      puts "Please enter x value"
      y = gets.chomp.to_i
      @board2.hit(x, y)
      @board2.print_track

      if @board2.check_end
        puts "#{@player1} Win!"
        break
      end
  
      puts "It's #{@player2}'s turn to hit"
      puts "Please enter y value"
      x = gets.chomp.to_i
      puts "Please enter x value"
      y = gets.chomp.to_i
      @board1.hit(x, y)
      @board1.print_track

      if @board1.check_end
        puts "#{@player2} Win!"
        break
      end

    end
  end

  def start
    stage_1
    stage_2
    puts 'Game Over!'
  end
end
