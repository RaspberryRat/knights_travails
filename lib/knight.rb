class Knight
  def initialize
    @game_board = Board.new(self)
    # starts knight of position [4, 4]
    @position = nil
    @node_queue = []
    @fastest_path = []
    @current_path = []
  end
  attr_accessor :game_board, :position, :node_queue, :fastest_path, :current_path

  
  def knight_moves(start_position, end_position)
    node = Node.new(start_position)
    @position = node
    @node_queue << node
    build_move_tree(end_position)
    # paths = path_to_end_node(end_position)
    all_end_positions = find_end_positions(end_position)
    find_parents(all_end_positions)
    print_path
  end

  def build_move_tree(end_position)
     return if @node_queue.length.zero?
    node = @node_queue.shift
    return if node.location == end_position

    next_moves = add_moves(node)
    next_moves.possible_nodes.each { |next_node| @node_queue << next_node }
    build_move_tree(end_position)
    @position
  end

  def add_moves(node)
    next_moves = move_list(node.location).map do |possible_move|
      node.add_next_node(Node.new(possible_move))
    end
    node
  end

  def path_to_end_node(end_position, node = @position, prev_node = node, i = 0, path = [])
    return if node.nil?
    node.possible_nodes.map do |n|
      if n.location == end_position
        @fastest_path = path if @fastest_path.length.zero?
        @fastest_path = path if path.length < @fastest_path.length
        return path = []
      end
    end
    if node.possible_nodes.nil?
      return path_to_end_node(end_position, prev_node, prev_node, i + 1, path)
    else
      path << node.location
      return path_to_end_node(end_position, node.possible_nodes[i], node, i, path)
    end

    path
  end

  def find_end_positions(end_position, node = @position, arr = [])
    return if node.nil?

    arr << node if node.location == end_position
    node.possible_nodes.each { |move| find_end_positions(end_position, move, arr) }
    arr
  end

  def find_parents(arr_end_positions, end_position = 0, node = @position)
    return if node.nil?

    if node.possible_nodes.include?(end_position)
      save_path(node)
      end_position = node
      if end_position == @position
        check_fastest_path
        return find_parents(arr_end_positions, 0, @position)
      end
      return find_parents(arr_end_positions, end_position, @position)
    end

    if end_position == 0
      save_path(arr_end_positions[0])
      end_position = arr_end_positions.shift 
    end

    node.possible_nodes.each do |move|
      find_parents(arr_end_positions, end_position, move)
    end
  end

  def save_path(node)
    @current_path.unshift(node)
  end

  def check_fastest_path
    @fastest_path = @current_path if @fastest_path.length == 0
    @fastest_path = @current_path if @fastest_path.length > @current_path.length
    @current_path = []
  end

  def print_path
    puts "You made it in #{@fastest_path.length - 1}! Here's your path:"
    @fastest_path.each { |node| print "#{node.location}\n"}
  end



  # def move_knight
  #   print "\n\nWhere do you want to move the knight?>>"
  #   move = gets.chomp
  #   game_check(move)
  #   until move.match /[1-8]\s[1-8]/
  #     puts "\nBoard position must only be between 1 - 8 in format \"# #\""
  #     move = gets.chomp
  #     game_check(move)
  #   end
  #   # move[2] for second position because input has space in string[1]
  #   move = [move[0].to_i, move[2].to_i]
  #   unless legal_move?(move)
  #     puts "Illegal move" 
  #     return move_knight
  #   end
  #   @position = move
  #   print "\n#{current_poisition}\n"
  # end

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

  # def legal_move?(move)
  #   return true if move_list.include?(move)
  # end

end