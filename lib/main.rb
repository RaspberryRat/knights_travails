require "pry-byebug"
require_relative "./knight"
require_relative "./board"


game = Knight.new

print game.current_poisition
puts "\n"
print game.possible_moves

