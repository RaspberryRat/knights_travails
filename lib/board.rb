class Board
  def initialize(knight)
    @knight = knight
    @board = create_board
    binding.pry
  end

  attr_reader :board, :knight

  def create_board
    # create a grid 8*8
    # grid is a to h on x and 1 to 8 on y
    board_array = []
    i, j = 1, 1
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