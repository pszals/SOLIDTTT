require 'ai_player'
require 'board'

describe AIPlayer do
  let(:ai)    { AIPlayer.new('O') }
  let(:board) { Board.new.squares  }

  context 'generates list of open squares' do
    it 'gathers open squares from empty board into a list' do
      ai.gather_open_squares(board)
      ai.open_squares.length.should == 9
    end

    it 'gathers open squares from board with one move into a list' do
      board[0].set_contents('O')
      ai.gather_open_squares(board)
      ai.open_squares.length.should == 8
    end
  end
end
