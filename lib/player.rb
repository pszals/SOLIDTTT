class Player
  attr_reader :piece, :move
  def initialize(piece)
    @piece = piece
  end

  def get_move(instream=$stdin, rules, piece)
    @move = instream.gets.chomp
  end
end
