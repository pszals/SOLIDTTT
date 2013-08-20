class Square
  attr_accessor :contents

  def initialize
    @contents
  end

  def available?
    @contents.nil?
  end

  def set_contents(piece)
    @contents = piece
  end
end
