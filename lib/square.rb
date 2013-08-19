class Square
  attr_reader :contents

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
