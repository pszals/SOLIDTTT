require_relative 'square'

class SquareHolder
  def squares
    @squares ||= Array.new(9).map {|square| Square.new}
  end

  def square_at(location)
    squares[location.to_i]
  end

  def find_winner
    combinations.each do |combination|
      return 'X'  if combination.all? do |location|
        square_at(location).contents == 'X'
      end
      return 'O'  if combination.all? do |location|
        square_at(location).contents == 'O'
      end
    end
    return nil
  end

  def combinations
    [
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
end
