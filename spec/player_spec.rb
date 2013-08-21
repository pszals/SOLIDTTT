require 'player'
require 'stringio'

describe Player do
# let(:mock_io) {double('IO', :ask_for_move)}
  let(:player_1) { Player.new('X')}#, mock_io) }

  it 'holds a piece' do
    player_1.piece.should == 'X'
  end

  it 'gets a square to mark when making move' do
    stringio = StringIO.new("5\n")

    player_1.get_move(stringio)

    player_1.move.should == '5'
  end
end
