require 'square_holder'

describe SquareHolder do
  let(:holder) { described_class.new }
  context 'knows about the board' do
    it 'starts with a list of 9 squares' do
      holder.squares.count.should == 9
      holder.squares.all? {|square| square.available?}.should be_true
    end

    it 'returns the square at a location' do
     square = holder.square_at('1')

      square.available?.should be_true
    end
  end

  context 'finds winner' do
    it 'knows combinations' do
      holder.combinations.should == [
        [0,1,2],
        [3,4,5],
        [6,7,8],

        [0,3,6],
        [1,4,7],
        [2,5,8],

        [0,4,8],
        [2,4,6]
      ]
    end

    it 'finds winner within top row' do
      holder.squares[0].contents = 'X'
      holder.squares[1].contents = 'X'
      holder.squares[2].contents = 'O'

      holder.find_winner.should == nil
    end

    it 'finds winner within collumns' do
      holder.squares[0].contents = 'X'
      holder.squares[3].contents = 'X'
      holder.squares[6].contents = 'X'

      holder.find_winner.should == 'X'
    end

    it 'finds winner within diagonals' do
      holder.squares[0].contents = 'O'
      holder.squares[4].contents = 'O'
      holder.squares[8].contents = 'O'

      holder.find_winner.should == 'O'
    end

    it 'returns nil when no winner is present' do
      holder.find_winner.should == nil
      
      holder.squares[0].contents = 'O'
      holder.squares[4].contents = 'X'
      holder.squares[8].contents = 'O'

      holder.find_winner.should == nil
      
    end
  end
end
