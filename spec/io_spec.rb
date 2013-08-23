require 'io'
require 'stringio'
require 'board'

describe Io do
  def output
    @output_stream.string
  end
  
  def io(input='')
    instream = StringIO.new(input)
    @output_stream = StringIO.new
    described_class.new(instream, @output_stream)
  end

  it 'prompts for input to configure game' do
    io.prompt_configure_players
    @output_stream.rewind
    @output_stream.gets.should include 'configure'
  end

  it 'prompts for a move' do
    io.prompt_move
    @output_stream.rewind
    @output_stream.gets.should include 'move'
  end

  it 'sends input error message' do
    io.invalid_input
    @output_stream.rewind
    @output_stream.gets.should include 'invalid'
  end

  it 'gets a move' do
    io('1').get_move.should == '1'
  end

  it 'converts a board to a string' do
    board = Board.new.squares
    io.board_as_string(board).should ==
      "   |   |   \n"\
      "---|---|---\n"\
      "   |   |   \n"\
      "---|---|---\n"\
      "   |   |   \n" 

  end

  it 'prints board as string' do
    board = Board.new.squares
    io.display_board(board)
    @output_stream.rewind
    @output_stream.gets(nil).should ==
      "   |   |   \n"\
      "---|---|---\n"\
      "   |   |   \n"\
      "---|---|---\n"\
      "   |   |   \n" 
  end

  it 'displays game over message' do
    winner = 'X'
    io.display_winner(winner)
    @output_stream.rewind
    @output_stream.gets.should include 'X'
  end

  it 'displays tie game' do
    winner = nil
    io.display_winner(winner)
    @output_stream.rewind
    @output_stream.gets.should include 'Tie'
  end
end
