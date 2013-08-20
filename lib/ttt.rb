require_relative 'square_holder'

class TTT
  attr_reader :squares
  attr_accessor :error, :piece

  def initialize
    @squares = square_holder.squares
    @piece   = 'X'
  end

  def valid?(input)
    !(input =~ /\A[0-8]\Z/) ? false : true
  end

  def store_move(location, piece=@piece)
    if available?(location)
      square_at(location).set_contents(piece)
      @piece == 'X' ? @piece = 'O' : @piece = 'X'
      @error = false
    else
      raise_error
    end
  end

  def available?(location)
    square_at(location).available?
  end

  def find_winner
    square_holder.find_winner
  end

  def over?
    squares.all? {|square| !square.available?} || find_winner
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
