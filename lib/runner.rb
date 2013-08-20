require_relative 'ttt'
require_relative 'player'
require_relative 'io'

class Runner
  attr_accessor :player, :ttt, :io

  def initialize
    @ttt    = TTT.new
    @io     = Io.new($stdin, $stdout)
  end

  def play_game
    while !ttt.over?
      take_turn
    end
    if ttt.over?
      io.display_board(ttt.squares)
      io.display_winner(ttt.find_winner)
      exit
    end
  end

  def take_turn
    io.display_board(ttt.squares)
    io.prompt_move
    move = @io.get_move
    if ttt.valid?(move)
      ttt.store_move(move)
    end
    if ttt.error
      io.invalid_input
      io.prompt_move
      ttt.store_move(move)
    end
  end
end
