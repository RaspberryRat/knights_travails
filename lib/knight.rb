# Finds fastest path a knight can move from one location to a second location on an 8 * 8 board
class Knight
  def initialize
    @game_board = Board.new
    @position = nil
    @node_queue = []
    @fastest_path = []
    @current_path = []
  end
  attr_accessor :position, :node_queue, :fastest_path, :current_path

  # Main method, sets root node, and calls other methods to find fastest path
  def knight_moves(start_position, end_position)
    node = Node.new(start_position)
    @position = node
    @node_queue << node
    build_move_tree(end_position)
    all_end_positions = find_end_pos(end_position)
    find_path(all_end_positions)
    print_path
  end

  # Builds tree of possible moves from start position to end position
  def build_move_tree(end_position)
    return if @node_queue.length.zero?

    node = @node_queue.shift
    return if node.location == end_position

    next_moves = add_moves(node)
    next_moves.possible_nodes.each { |next_node| @node_queue << next_node }
    build_move_tree(end_position)
  end

  # used with #build_move_tree, finds all possible moves from current location
  def add_moves(node)
    move_list(node.location).map do |possible_move|
      node.add_next_node(Node.new(possible_move))
    end
    node
  end

  # returns list of all possible move locations from current board position
  def move_list(position)
    move_array = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, 2], [2, 1], [2, -1], [1, -2]]
    moves = move_array.map do |move|
      new_move = [move[0] + position[0], move[1] + position[1]]
      new_move if new_move.none? { |n| n < 1 || n > 8 }
    end
    moves.compact
  end

  # finds all nodes in tree that location == end position
  def find_end_pos(end_position, node = @position, ends = [])
    return if node.nil?

    ends << node if node.location == end_position
    node.possible_nodes.each { |move| find_end_pos(end_position, move, ends) }
    ends
  end

  # finds path from root node(@position) to all nodes with end_positon location
  def find_path(all_ends_array, end_position = 0, node = @position)
    return if node.nil?

    # if node found with end_position, saves node and recurisvely calls method with next node with end_position.
    if node.possible_nodes.include?(end_position)
      @current_path.unshift(node)
      end_position = node
      if end_position == @position
        check_fastest_path
        return find_path(all_ends_array, 0, @position)
      end
      return find_path(all_ends_array, end_position, @position)
    end
    # default end_position is 0 pulls out next end node and sets to end_position
    if end_position == 0
      @current_path.unshift(all_ends_array[0])
      end_position = all_ends_array.shift
    end
    node.possible_nodes.each do |move|
      find_path(all_ends_array, end_position, move)
    end
  end

  # compares path to end_position from #find_path to, fastest_path to find fasest_path to end_position node
  def check_fastest_path
    @fastest_path = @current_path if @fastest_path.empty?
    @fastest_path = @current_path if @fastest_path.length > @current_path.length
    @current_path = []
  end

  # prints fastest path from start to end position to terminal
  def print_path
    puts "\n\nYou made it in #{@fastest_path.length - 1}! Here's your path:"
    @fastest_path.each { |node| print "#{node.location}\n"}
  end
end