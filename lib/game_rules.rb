class GameRules
  FIRST_PLAYER_PIECE = "X"
  GAME_PEICES = [FIRST_PLAYER_PIECE, "O"]

  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def find_winner
    combinations.each do |combination|
      GAME_PEICES.each do |piece|
        return piece if winner?(piece, combination)
      end
    end

    return nil
  end

  def over?
    squares.all? {|square| !square.available?} || find_winner
  end

  private

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
