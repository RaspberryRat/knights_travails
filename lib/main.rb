require "pry-byebug"
require_relative "./knight"
require_relative "./board"
require_relative "./node"

def move_knight
  puts "Enter a start location (ex. 1 1)"
  start_pos = gets.chomp
  quit?(start_pos)
  until start_pos.match /[1-8]\s[1-8]/
    puts "\nBoard position must only be between 1 - 8 in format \"# #\""
    start_pos = gets.chomp
  end

  puts "Enter a end location (ex. 4 4)"
  end_pos = gets.chomp
  quit?(end_pos)
  until end_pos.match /[1-8]\s[1-8]/
    puts "\nBoard position must only be between 1 - 8 in format \"# #\""
    end_pos = gets.chomp
  end
  start_pos = start_pos[0].to_i, start_pos[2].to_i
  end_pos = end_pos[0].to_i, end_pos[2].to_i
  Knight.new.knight_moves(start_pos, end_pos)
  move_knight
end

def quit?(str)
  exit if str.strip == "quit" || str.strip == "exit" || str.strip == "q"
end

puts "\n\nWelcome to Knights Travails!\nFind the fastest path a knight can move on an 8 by 8 board.\n\n"
puts "Type 'q' to quit"
move_knight
