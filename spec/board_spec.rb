require 'board'

describe Board do
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
end
