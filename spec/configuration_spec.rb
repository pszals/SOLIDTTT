require 'player'
require 'ai_player'
require 'configuration'

describe Configuration do
  let(:config) {Configuration.new}
  context 'configuring players' do
    it 'prompts for configuring players' do
      config.io.should_receive(:prompt_configure_players)
      config.io.should_receive(:get_move)
      config.configure_players
    end

    it 'validates the input' do
      config.input_valid?(1).should be_true      
      config.input_valid?(5).should be_false
      config.input_valid?(2).should be_true
      config.input_valid?('1').should be_false
      config.input_valid?('value').should be_false
    end

    it 'instantiates two human players' do
      input = 1
      config.instantiate_players(input)
      config.players[0].should be_kind_of(Player)
      config.players[1].should be_kind_of(Player)
    end

    it 'instantiates a human and a computer' do
      input = 2
      config.instantiate_players(input)
      config.players[0].should be_kind_of(Player)
      config.players[1].should be_kind_of(AIPlayer)
    end

    it 'instantiates two computer players' do
      input = 3
      config.instantiate_players(input)
      config.players[0].should be_kind_of(AIPlayer)
      config.players[1].should be_kind_of(AIPlayer)
    end
  end
end
