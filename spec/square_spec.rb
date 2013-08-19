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
end
