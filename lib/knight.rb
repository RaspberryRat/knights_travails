class Knight
  def initialize
    @game_board = Board.new(self)
    # starts knight of position d4def
    @position = game_board.board[27]
    @possible_moves = move_list
  end
  attr_accessor :game_board, :position, :possible_moves

  def current_poisition
    @position
  end

  def move_knight
    @position = game_board.board[10]
  end

  def move_list
    move_array = [
      [-2, 1],
      [-2, -1],
      [-1, 2],
      [-1, -2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2]
    ]
    move_array.each do |move|
      new_move = [move[0] + @position[0], move[1] + @position[1]]
      new_move if new_move.none? { |n| n < 0 || n > 8 }
    end
  end

end