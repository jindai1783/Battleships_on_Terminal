class Board

  attr_reader :element

  def initialize(size)
    @size = size
    @element = Array.new(size){Array.new(size)}
  end

  def register_ship(x, y)
    @element[x][y] = true
  end

  def print_ship
    puts 
    @element.each do |x|
      x.each do |y|
        if y == nil
          print '- '
        elsif y == true
          print '$ '
        else
          print '- '
        end
      end
      puts
    end
  end

end