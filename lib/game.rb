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
    @board = Board.new(gets.chomp.to_i)
  end

  def set_fleet(player, ship_size, ship_name)
    puts "#{player}, please set your #{ship_name} head x value"
    ax = gets.chomp.to_i
    puts "#{player}, please set your #{ship_name} head y value"
    ay = gets.chomp.to_i
    puts "#{player}, please set your #{ship_name} orientation (N, E, S or W)"
    ao = gets.chomp
    case ao
    when 'N'
      for i in 0..ship_size - 1
        @board.register_ship(ax + i, ay)
      end
    when 'E'
      for i in 0..ship_size - 1
        @board.register_ship(ax, ay - i)
      end
    when 'S'
      for i in 0..ship_size - 1
        @board.register_ship(ax - i, ay)
      end
    when 'W'
      for i in 0..ship_size - 1
        @board.register_ship(ax, ay + 1)
      end
    end
  end

  def start
    get_name
    set_board
    # set_fleet(@player1, 5)
    # @board.print_ship
    # set_fleet(@player1, 4)
    # @board.print_ship

    fleet1 = Fleet.new
    fleet1.fleet.each do |ship_name, ship_size|
      set_fleet(@player1, ship_size, ship_name)
      @board.print_ship
    end

  end
end