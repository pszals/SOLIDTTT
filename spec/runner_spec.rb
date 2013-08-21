require 'runner'

describe Runner do
  let(:runner) { Runner.new }

 xit 'takes a turn' do
    runner.io.should_receive(:display_board)
    runner.io.should_receive(:prompt_move)
    runner.player.should_receive(:get_move)
  end
end
