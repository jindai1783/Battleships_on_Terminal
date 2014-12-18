class Fleet

  attr_reader :fleet
  def initialize
    @fleet = {
      "aircraft carrier" => 5,
      "battleship" => 4,
      "submarine" => 3,
      "destroyer" => 3,
      "patrol boat" => 2,
    }
  end

end
