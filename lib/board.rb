require_relative 'square'

class Board
  def squares
    @squares ||= Array.new(9).map {|square| Square.new}
  end

  def square_at(location)
    squares[location.to_i]
  end

  def set_indices
    @squares.each_with_index {|square, index| square.set_index(index)}
  end
end
