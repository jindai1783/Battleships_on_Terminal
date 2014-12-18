require 'game'

describe Game do
  let(:game) {Game.new}
  xit 'Should get name from player 1 & 2' do
    expect(game.get_name).to be_a_kind_of String
  end

  xit 'Should set the board to be n*n' do
    game.set_board
    expect(game.board).to be_a_kind_of Board
  end

  xit 'Should set the fleet on board' do
    expect(game.set_fleet).to be_a_kind_of String
  end
end