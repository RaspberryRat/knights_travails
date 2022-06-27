class Knight
  def initialize
    @game_board = Board.new(self)
    # starts knight of position [4, 4]
    @position = nil
    # @move_tree = build_graph
    @node_queue = []
    
  end
  attr_accessor :game_board, :position, :possible_moves, :node_queue, :move_tree



  def knight_moves(start_position, end_position)
    node = Node.new(start_position)
    @position = node
    @node_queue << node
    move_queue(end_position)
    binding.pry
    
  end

  def move_queue(end_position)
    return if @node_queue.length.zero?
    node = @node_queue.shift
    return if node.location == end_position

    next_moves = add_moves(node)
    next_moves.adj_nodes.each { |next_node| @node_queue << next_node }
    move_queue(end_position)
    @position
  end


  def add_moves(node)
    next_moves = move_list(node.location).map do |possible_move|
      # location = check_duplicate(possible_move)
      # location = location.flatten.pop unless location == false
      node.add_adj_node(Node.new(possible_move)) #unless location == false
    end
    node
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