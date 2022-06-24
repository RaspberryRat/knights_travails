require "pry-byebug"

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

class Board
  def initialize(knight)
    @knight = knight
    @board = create_board
  end

  attr_reader :board, :knight

  def create_board
    # create a grid 8*8
    # grid is a to h on x and 1 to 8 on y
    let_array = "a".upto("h").map { |let| let }
    num_array = 1.upto(8).map { |num| num }
    board_array = []
    let_array.each do |let|
      num_array.each { |num| board_array << [let, num] }
    end
    board_array
  end
end

game = Knight.new

print game.current_poisition
game.move_knight
print game.current_poisition

