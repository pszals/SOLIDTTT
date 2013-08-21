require 'square'

describe Square do
  it 'is available by default' do
    described_class.new.available?.should be_true
  end

  it 'can be taken' do
    square = described_class.new

    square.set_contents("X")

    square.available?.should be_false
    square.contents.should == "X"
  end

  it 'undoes set_contents' do
    square = described_class.new
    
    square.set_contents("X")
    square.available?.should be_false

    square.undo_set_contents
    square.available?.should be_true
  end

  it 'can have an index' do
    square = described_class.new

    square.set_index(0)
    square.index.should == 0
  end
end
