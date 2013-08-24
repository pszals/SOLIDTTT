require 'runner'

describe Runner do
  let(:players) { [Player.new('X'), Player.new('O')] }
  let(:runner)  { Runner.new(players) }

  it 'swaps players' do
    player = runner.player
    player.piece.should == 'X'

    runner.swap_players!
    player = runner.player
    player.piece.should == 'O'
  end
end
