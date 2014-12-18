require 'board'

describe Board do
  it 'should print a map of fleet' do
    board = Board.new(5)
    expect(board.print_ship).to be_a_kind_of Array
  end
end