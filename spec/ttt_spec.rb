require 'ttt'

describe TTT do
  context 'making a move' do
    it 'stores spaces with a piece' do
      piece  = "X"
      square = "1"
      game = described_class.new

      game.store_move(square, piece)

      game.available?(square).should be_false
    end

    it 'raises error if space is taken' do
      piece  = "X"
      square = "1"
      game = described_class.new

      game.store_move(square, piece)
      game.store_move(square, piece)
      game.error.should be_true
    end
  end

  context 'board state' do
    it 'knows the squares on the board' do
      game = described_class.new

      game.squares.all? {|square| square.available?}.should be_true
    end

    it 'keeps state of the squares' do
      game = described_class.new
      game.store_move('1', 'X')

      game.squares.all? {|square| square.available?}.should be_false
      game.available?('1').should be_false
      game.available?('0').should be_true
    end
  end
end
