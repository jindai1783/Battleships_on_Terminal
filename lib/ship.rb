class Ship

  attr_reader :fleet
  def initialize
    @fleet = {
      "Aircraft carrier" => 5,
      "Battleship" => 4,
      "Submarine" => 3,
      "Destroyer" => 3,
      "Patrol boat" => 2,
    }
  end

end