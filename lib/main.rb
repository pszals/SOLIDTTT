require_relative 'configuration'
require_relative 'runner'

config = Configuration.new
configuration = config.configure_players

runner = Runner.new(configuration)
runner.play_game
