require 'square_holder'

describe SquareHolder do
  it 'starts with a list of 9 squares' do
    holder = described_class.new
    holder.squares.count.should == 9
    holder.squares.all? {|square| square.available?}.should be_true
  end

  it 'returns the square at a location' do
    holder = described_class.new

    square = holder.square_at('1')

    square.available?.should be_true
  end
end
