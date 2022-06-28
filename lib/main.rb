require "pry-byebug"
require_relative "./knight"
require_relative "./board"
require_relative "./node"



game = Knight.new

game.knight_moves([4, 4], [8, 8])
Knight.new.knight_moves([3, 3], [4, 3])
