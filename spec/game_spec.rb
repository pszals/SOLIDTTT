require 'game'
require 'board'

#game rules
#using constants for pieces
describe Game do
  let(:board) {Board.new}
  let(:game)  {described_class.new(board)}

  def set_move(location, piece)
    board.square_at(location).set_contents(piece)
  end

  context 'making a move' do
    it 'stores spaces with a piece' do
      piece  = "X"
      square = "1"

      game.store_move(square, piece)

      game.available?(square).should be_false
    end


    it 'knows the piece to play' do
      game.piece.should == 'X'
      game.store_move('1', game.piece)
      game.switch_piece     
      game.available?('1').should be_false

      game.piece.should == 'O'
    end
      
    context 'raising errors' do
      it 'raises error if space is taken' do
        piece  = "X"
        square = "1"

        game.store_move(square, piece)
        game.store_move(square, piece)

        game.error.should be_true
      end
    end
    context 'checking for move validity' do
      it 'raises error if input is not 1-9' do
        game.valid?('54').should == false
        game.valid?('a').should == false
        game.valid?('3').should == true
      end
      
      it 'is invalid if 1-9 and space is not open' do
        set_move('3', 'X')
        game.valid?('3').should be_false
      end
    end
  end

  context 'board state' do
    it 'knows the squares on the board' do
      game.squares.all? {|square| square.available?}.should be_true
    end

    it 'keeps state of the squares' do
      board.square_at('1').set_contents('X')

      game.squares.all? {|square| square.available?}.should be_false

      game.available?('1').should be_false
      game.available?('0').should be_true
    end
  end

  context 'game over' do
    it 'finds winner' do
      board.square_at('0').set_contents('X')
      board.square_at('1').set_contents('X')
      board.square_at('2').set_contents('X')

      game.available?('0').should be_false
      game.find_winner.should == 'X'
      game.over?.should be_true
    end

    it 'knows game is over when there is a tie' do
      game.find_winner.should == nil
      
      game.store_move('0', 'O')
      game.store_move('1', 'X')
      game.store_move('2', 'O')
      game.store_move('3', 'X')
      game.store_move('4', 'O')
      game.store_move('5', 'X')
      game.store_move('6', 'X')
      game.store_move('7', 'O')
      game.store_move('8', 'X')

      game.find_winner.should == nil

      game.over?.should == true
    end
  end
end
