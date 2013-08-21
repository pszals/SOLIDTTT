class AIPlayer
  attr_reader :piece, :move
  attr_accessor :open_squares

  def initialize(piece)
    @piece = piece
    @open_squares = []
  end

  def get_move
    @move = minimax
  end

  def gather_open_squares(board)
    @open_squares = []
    board.each {|square| @open_squares << square if square.available?}
  end
end

