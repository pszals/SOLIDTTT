require_relative 'board'
require_relative 'game_rules'

class Game
  FIRST_PLAYER_PIECE  = "X"
  SECOND_PLAYER_PIECE = "O"
  GAME_PEICES = [FIRST_PLAYER_PIECE, "O"]

  attr_reader :squares
  attr_accessor :error, :piece

  def initialize(board)
    @board   = board
    @squares = board.squares
    @piece   = FIRST_PLAYER_PIECE
  end

  def valid?(input)
    !(input =~ /\A[0-8]\Z/) ? false : true && available?(input)
  end

  def store_move(location, piece=@piece)
    if available?(location)
      square_at(location).set_contents(piece)
#     switch_piece
      @error = false
    else
      raise_error
    end
  end

  def available?(location)
    square_at(location).available?
  end

  def find_winner
    GameRules.new(@board).find_winner
  end

  def over?
    squares.all? {|square| !square.available?} || find_winner
  end

  def switch_piece
    @piece == FIRST_PLAYER_PIECE ? @piece = SECOND_PLAYER_PIECE : @piece = FIRST_PLAYER_PIECE
  end

  private

  def square_at(location)
    @board.square_at(location)
  end

  def raise_error
    @error = true
  end
end
