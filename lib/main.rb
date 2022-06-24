require_relative "./knight"
require_relative "./board"


game = Knight.new

print game.current_poisition
game.move_knight
print game.current_poisition

