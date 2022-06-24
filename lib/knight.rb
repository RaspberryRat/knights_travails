class Knight
  def initialize
    @game_board = Board.new(self)
    # starts knight of position d4def
    @position = game_board.board[1]
    @possible_moves = move_list
    game_loop
  end
  attr_accessor :game_board, :position, :possible_moves

  def current_poisition
    @position
  end

  def game_loop
    while 
      move_knight
    end
  end

  def game_check(str)
    return print "\n#{move_list}" if str.strip == "moves"
    return print "\n#{@position}" if str.strip == "position"
    exit if str.strip == "quit" || str.strip == "exit"
  end

  def move_knight
    print "\n\nWhere do you want to move the knight?>>"
    move = gets.chomp
    game_check(move)
    until move.match /[1-8]\s[1-8]/
      puts "\nBoard position must only be between 1 - 8 in format \"# #\""
      move = gets.chomp
      game_check(move)
    end
    # move[2] for second position because input has space in string[1]
    move = [move[0].to_i, move[2].to_i]
    unless legal_move?(move)
      puts "Illegal move" 
      return move_knight
    end
    @position = move
    print "\n#{current_poisition}\n"
  end

  def move_list
    move_array = [
      [-2, 1],
      [-2, -1],
      [-1, 2],
      [-1, -2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2]
    ]
    moves = move_array.map do |move|
      new_move = [move[0] + @position[0], move[1] + @position[1]]
      new_move if new_move.none? { |n| n < 1 || n > 8 }
    end
    moves.compact
  end

  def legal_move?(move)
    return true if move_list.include?(move)
  end

end