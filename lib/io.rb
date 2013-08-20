class Io
  attr_reader :instream, :outstream

  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
  end

  def prompt_move
    outstream.puts "Enter a move: "
  end

  def invalid_input
    outstream.puts "Input was invalid"
  end

  def get_move
    instream.gets.chomp
  end

  def display_board(board)
    outstream.puts board_as_string(board)
  end

  def board_as_string(board)
    board.each_slice(3).map {|a,b,c| " #{a.contents || ' '} | #{b.contents || ' '} | #{c.contents || ' '} \n"}.join("---|---|---\n")
  end

  def display_winner(winner)
    if winner != nil
      outstream.puts "Player #{winner} wins!"
    else
      outstream.puts "Tie Game"
    end
  end
end
