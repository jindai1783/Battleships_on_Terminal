describe 'Integration' do
  it 'should print map of fleet after setting' do
    game = Game.new
    game.set_board
    game.set_fleet
    expect(game.board.print_ship).to be_a_kind_of Array
  end
end