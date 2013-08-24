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
    if rules.find_winner == nil
      0
    elsif rules.find_winner == piece
      1.0
    else
      -1.0
    end
  end

  def get_opponent(piece)
    piece == 'O' ? 'X' : 'O'
  end

  def minimax(rules, piece, depth, alpha, beta)
    opponent = get_opponent(piece)
    score      = 0
    best_score = -1.0/0
    if rules.over?
      return score_board(rules, piece) / depth
    else
      new_alpha = alpha
      gather_open_squares(rules.board)
      @open_squares.each do |square|
        rules.store_move(square.index)
        rules.switch_piece
        score = -minimax(rules, opponent, depth + 1, -new_alpha, -beta)
        rules.undo_store_move(square.index)
        rules.switch_piece
        best_score = score if score > best_score
      end

    return best_score
    end
  end

  def get_move(rules, piece)
    best_square = nil
    best_score = -1.0/0
    opponent = get_opponent(piece)
    gather_open_squares(rules.board)
    rules.board.set_indices
    @open_squares.each do |square|
      rules.store_move(square.index)
      rules.switch_piece
      score = -minimax(rules, opponent, 1, -1.0/0, 1.0/0)
      rules.undo_store_move(square.index)
      rules.switch_piece
      if score > best_score
        best_score = score
        best_square = square
      end
    end 

    return best_square.index.to_s
  end
end

