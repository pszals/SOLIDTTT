require 'ai_player'
require 'board'
require 'game_rules'

describe AIPlayer do
  let(:ai)    {AIPlayer.new('O')   }
  let(:board) {Board.new           }
  let(:rules) {GameRules.new(board)}

  def set_contents(index, piece)
    board.squares[index].contents = [piece]
  end

  context 'generates list of open squares' do
    it 'gathers open squares from empty board into a list' do
      ai.gather_open_squares(board)
      ai.open_squares.length.should == 9
    end

    it 'gathers open squares from board with one move into a list' do
      board.squares[0].set_contents('O')
      ai.gather_open_squares(board)
      ai.open_squares.length.should == 8
    end
  end

  context 'scoring the board' do
   xit 'returns 1 if X wins' do
      set_contents(0, 'X')
      set_contents(1, 'X')
      set_contents(2, 'X')

      ai.score_board(rules, 'X').should == 1
    end

   xit 'returns -1 if O wins' do
      set_contents(0, 'O')
      set_contents(1, 'O')
      set_contents(2, 'O')

      ai.score_board(rules, 'O').should == -1
    end

   it 'returns 1 if X wins' do
     board = Board.new
     board.squares[0].contents = 'X'
     board.squares[1].contents = 'X'
     board.squares[2].contents = 'X'

     rules = GameRules.new(board)
     
     ai.score_board(rules, 'X').should == 1
   end

   it 'returns -1 if O wins' do
     board = Board.new
     board.squares[0].contents = 'O'
     board.squares[1].contents = 'O'
     board.squares[2].contents = 'O'

     rules = GameRules.new(board)

     ai.score_board(rules, 'O').should == -1
   end

   it 'returns 0 if tie game' do
     board = Board.new
     board.squares[0].contents = 'O'
     board.squares[1].contents = 'X'
     board.squares[2].contents = 'O'
     board.squares[3].contents = 'X'
     board.squares[4].contents = 'O'
     board.squares[5].contents = 'X'
     board.squares[6].contents = 'X'
     board.squares[7].contents = 'O'
     board.squares[8].contents = 'X'

     rules = GameRules.new(board)

     ai.score_board(rules, 'X').should == 0
   end
  end

  context 'minimax' do
    it 'returns score for a full board and marker' do
      board = Board.new
      board.squares[0].contents = 'O'
      board.squares[1].contents = 'X'
      board.squares[2].contents = 'O'
      board.squares[3].contents = 'X'
      board.squares[4].contents = 'O'
      board.squares[5].contents = 'X'
      board.squares[6].contents = 'X'
      board.squares[7].contents = 'O'
      board.squares[8].contents = 'X'

      rules = GameRules.new(board)
      ai.minimax(rules, 'X').should == 0
    end

    it 'returns score for board when X is one move away from winning' do
      board = Board.new
      board.squares[1].contents = 'X'
      board.squares[2].contents = 'O'
      board.squares[3].contents = 'X'
      board.squares[4].contents = 'O'
      board.squares[5].contents = 'X'
      board.squares[6].contents = 'X'
      board.squares[7].contents = 'O'
      board.squares[8].contents = 'O'

      rules = GameRules.new(board)
      ai.minimax(rules, 'O').should == 1
    end

    it 'returns score for board when game is tied' do
      board = Board.new
      board.squares[0].contents = 'O'
      board.squares[1].contents = 'X'
      board.squares[2].contents = 'O'
      board.squares[3].contents = 'X'
      board.squares[4].contents = 'O'
      board.squares[5].contents = 'X'
      board.squares[6].contents = 'X'
      board.squares[7].contents = 'O'
      board.squares[8].contents = 'X'

      rules = GameRules.new(board)
      ai.minimax(rules, 'O').should == 0
    end
  end

  it 'gets best square according to minimax' do
    board = Board.new
    board.squares[1].contents = 'X'
    board.squares[2].contents = 'O'
    board.squares[3].contents = 'X'
    board.squares[4].contents = 'O'
    board.squares[5].contents = 'X'
    board.squares[6].contents = 'X'
    board.squares[7].contents = 'O'
    board.squares[8].contents = 'O'
    rules = GameRules.new(board)
    ai.get_move(rules, 'X').should == 0
  end
end
