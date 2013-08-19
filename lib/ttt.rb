require 'square_holder'

class TTT
  attr_reader :squares
  attr_accessor :error

  def initialize
    @squares = square_holder.squares
  end

  def store_move(location, peice)
    if available?(location)
      square_at(location).set_contents(peice)
    else
      raise_error
    end
  end

  def available?(location)
    square_at(location).available?
  end

  private

  def square_holder
    @square_holder ||= SquareHolder.new
  end

  def square_at(location)
    square_holder.square_at(location)
  end

  def raise_error
    @error = true
  end
end
