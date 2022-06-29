# creates an 8 * 8 chess board from [1, 1] to [8, 8] for knight to move on
class Board
  def initialize
    @board = create_board
  end
  attr_reader :board

  private
  
  # creates 8*8 board
  def create_board
    board_array = []
    (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
    board_array
  end
end
