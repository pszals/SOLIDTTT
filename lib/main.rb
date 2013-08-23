require_relative 'configuration'
require_relative 'runner'

config = Configuration.new
config.configure_players

runner = Runner.new(config.players)
runner.play_game
