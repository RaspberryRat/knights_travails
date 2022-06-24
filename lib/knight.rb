class Knight
  def initialize
    @game_board = Board.new(self)
    @position = game_board.board[0]
  end
  attr_accessor :game_board, :position

  def current_poisition
    @position
  end

  def move_knight
    @position = game_board.board[10]
  end

end