class Player
  attr_reader :piece, :move
  def initialize(piece)
    @piece = piece
  end

  def make_move(instream=$stdin)
    @move = instream.gets.chomp
  end
end
