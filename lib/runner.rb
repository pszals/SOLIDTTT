require_relative 'board'
require_relative 'game_rules'
require_relative 'player'
require_relative 'io'

class Runner
  attr_accessor :player, :game, :io, :board, :players

  def initialize(players)
    @board  = Board.new
    @game   = GameRules.new(@board)
    @io     = Io.new($stdin, $stdout)
    @players = players
    @player = @players[0]
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
    move = @player.get_move(@game, @players[0].piece)
    if game.valid?(move)
      game.store_move(move)
      game.switch_piece
      swap_players!
    else
      io.invalid_input
      take_turn
    end
  end

  def swap_players!
    @players.rotate!
    @player = @players[0]
  end
end
