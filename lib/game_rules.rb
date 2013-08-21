class GameRules
  FIRST_PLAYER_PIECE  = "X"
  SECOND_PLAYER_PIECE = "O"
  GAME_PIECES = [FIRST_PLAYER_PIECE, SECOND_PLAYER_PIECE]

  attr_accessor :board, :piece, :squares

  def initialize(board)
    @board   = board
    @squares = board.squares
    @piece   = FIRST_PLAYER_PIECE
  end

  def find_winner
    combinations.each do |combination|
      GAME_PIECES.each do |piece|
        return piece if winner?(piece, combination)
      end
    end

    return nil
  end

  def over?
    squares.all? {|square| !square.available?} || find_winner
  end

  def store_move(location, piece=@piece)
    square_at(location).set_contents(piece)
    switch_piece
  end

  def valid?(input)
    !(input =~ /\A[0-8]\Z/) ? false : true && available?(input)
  end

  def available?(location)
    square_at(location).available?
  end

  def switch_piece
    @piece == FIRST_PLAYER_PIECE ? @piece = SECOND_PLAYER_PIECE : @piece = FIRST_PLAYER_PIECE
  end

  private

  def square_at(location)
    @board.square_at(location)
  end

  def winner?(piece, combination)
    return piece if combination.all? do |location|
      @board.square_at(location).contents == piece
    end
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
