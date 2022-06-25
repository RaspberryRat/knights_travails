require "pry-byebug"
require_relative "./knight"
require_relative "./board"
require_relative "./node"



game = Knight.new

print game.move_tree
# print game.knight_moves([4, 4], [1, 8])