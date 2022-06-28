require "pry-byebug"
require_relative "./knight"
require_relative "./board"
require_relative "./node"



game = Knight.new

game.knight_moves([4, 4], [1, 1])
# game.knight_moves([1, 1], [1, 5])
