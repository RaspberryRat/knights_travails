require_relative "./knight"
require_relative "./board"
require_relative "./node"

def move_knight
  start_square = start_position
  destination = user_destination
  start_square = start_square[0].to_i, start_square[2].to_i
  destination = destination[0].to_i, destination[2].to_i
  Knight.new.knight_moves(start_square, destination)
  move_knight
end

def start_position
  puts "Enter a start location (ex. 1 1)"
  start_square = gets.chomp
  quit?(start_square)
  until start_square.match /[1-8]\s[1-8]/
    puts "\nBoard position must only be between 1 - 8 in format \"# #\""
    start_square = gets.chomp
  end
  start_square
end

def user_destination
  puts "Enter an end location (ex. 4 4)"
  destination = gets.chomp
  quit?(destination)
  until destination.match /[1-8]\s[1-8]/
    puts "\nBoard position must only be between 1 - 8 in format \"# #\""
    destination = gets.chomp
  end
  destination
end

def quit?(str)
  exit if str.strip == "quit" || str.strip == "exit" || str.strip == "q"
end

puts "\n\nWelcome to Knights Travails!\nFind the fastest path a knight can move on an 8 by 8 board.\n\n"
puts "Type 'q' to quit"
move_knight
