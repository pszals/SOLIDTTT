class Player
  attr_reader :piece, :move
  def initialize(piece)
    @piece = piece
  end

  def get_move(instream=$stdin)
    @move = instream.gets.chomp
  end
end
