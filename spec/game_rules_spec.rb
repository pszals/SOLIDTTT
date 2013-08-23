require 'game_rules'
require 'board'

describe GameRules do
  let(:board) {Board.new           }
  let(:rules) {GameRules.new(board)}

  def set_contents(index, piece)
    rules.board.squares[index].contents =  piece 
  end

  context 'finds winner' do
    it 'finds winner within top row' do
      set_contents(0, 'X')
      set_contents(1, 'X')
      set_contents(2, 'O')

      rules.find_winner.should == nil
    end

    it 'finds winner within collumns' do
      set_contents(0, 'X')
      set_contents(3, 'X')
      set_contents(6, 'X')

      rules.find_winner.should == 'X'
    end

    it 'finds winner within diagonals' do
      set_contents(0, 'O')
      set_contents(4, 'O')
      set_contents(8, 'O')

      rules.find_winner.should == 'O'
    end

    it 'returns nil when no winner is present' do
      rules.find_winner.should == nil

      set_contents(0, 'O')
      set_contents(4, 'X')
      set_contents(8, 'O')

      rules.find_winner.should == nil
    end
  end

  context 'making a move' do
    it 'stores spaces with a piece' do
      piece  = "X"
      square =  1 
      rules.store_move(square, piece)

      rules.piece.should == 'X'
      rules.available?(square).should be_false
    end

    it 'knows the piece to play' do
      rules.piece.should == 'X'
      rules.store_move(1, rules.piece)

      rules.available?('1').should be_false

      rules.piece.should == 'X'
    end
  end

  context 'checking for move validity' do
    it 'raises error if input is not 1-9' do
      rules.valid?('54').should == false
      rules.valid?('a').should == false
      rules.valid?('3').should == true
    end

    it 'is invalid if 1-9 and space is not open' do
      set_contents(3, 'X')
      rules.valid?('3').should be_false
    end
  end

  context 'board state' do
    it 'knows the squares on the board' do
      rules.squares.all? {|square| square.available?}.should be_true
    end

    it 'keeps state of the squares' do
      set_contents(1, 'X')

      rules.squares.all? {|square| square.available?}.should be_false

      rules.available?('1').should be_false
      rules.available?('0').should be_true
    end
  end

  context 'game over' do
    it 'finds winner' do
      set_contents(0, 'X')
      set_contents(1, 'X')
      set_contents(2, 'X')

      rules.available?('0').should be_false
      rules.find_winner.should == 'X'
      rules.over?.should be_true
    end

    it 'knows game is over when there is a tie' do
      rules.find_winner.should == nil

      set_contents(0, 'O')
      set_contents(1, 'X')
      set_contents(2, 'O')
      set_contents(3, 'X')
      set_contents(4, 'O')
      set_contents(5, 'X')
      set_contents(6, 'X')
      set_contents(7, 'O')
      set_contents(8, 'X')

      rules.find_winner.should == nil

      rules.over?.should == true
    end
  end

  context 'undoing a move' do
    it 'sets contents of a given square at index to nil' do
      rules.store_move(0)

      rules.available?('0').should be_false
      rules.piece.should == 'X'
      
      rules.undo_store_move('0')
      
      rules.available?('0').should be_true
      rules.piece.should == 'X'
    end
  end
end
