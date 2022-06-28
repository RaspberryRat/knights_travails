# creates an 8 * 8 chess board from [1, 1] to [8, 8] for knight to move on
class Board
  def initialize
    @board = create_board
  end
  attr_reader :board
  
  private
  def create_board
    board_array = []
    i = 1
    j = 1
    64.times do
      8.times do
        board_array << [i, j]
        j += 1
        j = 1 if j > 8
      end
      i += 1
      i = 1 if i > 8
    end
    board_array
  end
end
