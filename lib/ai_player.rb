class AIPlayer
  attr_reader :piece, :move
  attr_accessor :open_squares

  def initialize(piece)
    @piece = piece
    @open_squares = []
  end


  def gather_open_squares(board)
    @open_squares = []
    board.squares.each {|square| @open_squares << square if square.available?}
  end

  def score_board(rules, piece)
    if rules.find_winner == 'X'
      1
    elsif rules.find_winner == 'O'
      -1
    elsif rules.find_winner == nil
      0
    end
  end

  def minimax(rules, piece)
    score      = 0
    best_score = 1.0/0
    if rules.over?
      return score_board(rules, piece)
    else
      gather_open_squares(rules.board)
      @open_squares.each do |square|
        square.set_contents(piece)
        score = -minimax(rules, rules.piece)
        square.undo_set_contents
        best_score = score if score < best_score
      end
    end
    
    return best_score
  end

  def get_move(rules, piece)
    rules.board.set_indices
    best_square = nil
    best_score = 1.0/0
    gather_open_squares(rules.board)
    @open_squares.each do |square|
      square.set_contents(piece)
      score = -minimax(rules, rules.piece)
      square.undo_set_contents
      if score < best_score
        best_score = score
        best_square = square
      end
    end
    return best_square.index
  end
end

