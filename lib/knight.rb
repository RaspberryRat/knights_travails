class Knight
  def initialize
    @game_board = Board.new(self)
    # starts knight of position [4, 4]
    @position = Node.new(game_board.board[27])
    @move_tree = build_graph
    binding.pry
    @nodes = []
    
  end
  attr_accessor :game_board, :position, :possible_moves, :nodes, :move_tree

  def add_moves(node)
    next_moves = move_list(node.location).map do |possible_move|
      node.add_neighbour(Node.new(possible_move))
    end
    node
  end

  def build_graph(node = @position)

    move_list(node.location).map do |possible_move|
      x = check_duplicate(possible_move)
      x.flatten.pop if x.is_a?(Array)
      node.add_neighbour(Node.new(possible_move)) unless x == true
    end

    node.neighbours.map { |next_node| build_graph(next_node) }
    binding.pry

    @position
  end

  def check_duplicate(location, node = @position)
    return true if location == node.location

    node.neighbours.map { |neighbour| check_duplicate(location, neighbour)}
  end

  def knight_moves(start_position, end_position)
    node = Node.new(start_position)
    move_list(node.location).map do |possible_move|
      node.add_neighbour(Node.new(possible_move))
    end
    binding.pry
    return node if node.neighbours.any? { |move| move.location == end_position }
    binding.pry
    node.neighbours.map { |next_node| knight_moves(next_node, end_position) }
    binding.pry

  end

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

  def move_list(position = @position)
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
      new_move = [move[0] + position[0], move[1] + position[1]]
      new_move if new_move.none? { |n| n < 1 || n > 8 }
    end
    moves.compact
  end

  def legal_move?(move)
    return true if move_list.include?(move)
  end

end