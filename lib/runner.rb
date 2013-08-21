require_relative 'game'
require_relative 'player'
require_relative 'io'

class Runner
  attr_accessor :player, :game, :io, :board

  def initialize
    @board  = Board.new
    @game   = Game.new(board)
    @io     = Io.new($stdin, $stdout)
    @player = Player.new('X')
  end

  def play_game
    while !game.over?
      take_turn
    end

    io.display_board(game.squares)
    io.display_winner(game.find_winner)
  end

  def take_turn
    io.display_board(game.squares)
    io.prompt_move
    move = @player.get_move
    if game.valid?(move)
      game.store_move(move)
      #switch_current
    end

    if game.error
      io.invalid_input
      io.prompt_move
      game.store_move(move)
    end
  end
end
