class Square
  attr_accessor :contents, :index

  def initialize
    @contents
    @index
  end

  def available?
    @contents.nil?
  end

  def set_contents(piece)
    @contents = piece
  end

  def undo_set_contents
    @contents = nil
  end

  def set_index(index)
    @index = index
  end
end
