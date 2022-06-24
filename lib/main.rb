require "pry-byebug"

class Knight
  def initialize

    @position = nil
  end

  attr_accessor :position

end

class Board
  def initialize
    @board = create_board
  end

  attr_reader :board

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

x = Board.new
print x.board