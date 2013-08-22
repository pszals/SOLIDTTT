require_relative 'player'
require_relative 'ai_player'
require_relative 'io'

class Configuration
  attr_accessor :io, :players

  def initialize
    @io = Io.new($stdin, $stdout)
    @players = []
  end

  def configure_players
    @io.prompt_configure_players
    input = @io.get_move
    if input_valid?(input.to_i)
      instantiate_players(input)
    else
      configure_players
    end  
  end

  def input_valid?(input)
   p input
   [1, 2, 3].include? input
  end

  def instantiate_players(input)
    if input == 1
      @players = [Player.new('X'), Player.new('O')]
    elsif input == 2
      @players = [Player.new('X'), AIPlayer.new('O')]
    else
      @players = [AIPlayer.new('X'), AIPlayer.new('O')]
    end
  end
end
