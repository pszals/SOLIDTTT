require 'runner'

describe Runner do
  let(:runner) { Runner.new }

  it 'takes a turn' do
    runner.io.should_receive(:display_board)
    runner.io.should_receive(:prompt_move)
    runner.player.should_receive(:get_move)
    runner.take_turn
  end
end
