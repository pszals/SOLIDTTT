require 'game_rules'
require 'board'

describe GameRules do
  let(:board) {Board.new           }
  let(:rules) {GameRules.new(board)}

  def set_contents(index, piece)
    rules.board.squares[index].contents =  piece 
  end

  context 'finds winner' do
    it 'finds winner within top row' do
      set_contents(0, 'X')
      set_contents(1, 'X')
      set_contents(2, 'O')

      rules.find_winner.should == nil
    end

    it 'finds winner within collumns' do
      set_contents(0, 'X')
      set_contents(3, 'X')
      set_contents(6, 'X')

      rules.find_winner.should == 'X'
    end

    it 'finds winner within diagonals' do
      set_contents(0, 'O')
      set_contents(4, 'O')
      set_contents(8, 'O')

      rules.find_winner.should == 'O'
    end

    it 'returns nil when no winner is present' do
      rules.find_winner.should == nil

      set_contents(0, 'O')
      set_contents(4, 'X')
      set_contents(8, 'O')

      rules.find_winner.should == nil
    end
  end
end
