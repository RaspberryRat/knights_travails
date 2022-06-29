# Finds fastest path a knight can move from one location to a second location on an 8 * 8 board
class Knight
  def initialize
    @game_board = Board.new
    @position = nil
    @node_queue = []
    @path = []
  end
  attr_accessor :position, :node_queue, :path

  # Main method, sets root node, and calls other methods to find fastest path
  def knight_moves(start_position, destination)
    node = Node.new(start_position)
    @position = node
    @node_queue << node
    build_move_tree(destination)
    destination = find_destination(destination).shift
    @path << destination
    find_path(destination)
    print_path
  end

  private
  # Builds tree of possible moves from start position to destination
  def build_move_tree(destination)
    return if @node_queue.length.zero?

    node = @node_queue.shift
    return if node.location == destination

    next_moves = add_moves(node)
    next_moves.children.each { |next_node| @node_queue << next_node }
    build_move_tree(destination)
  end

  # used with #build_move_tree, finds all possible moves from current location
  def add_moves(node)
    move_list(node.location).map do |possible_move|
      node.add_children(Node.new(possible_move))
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
  def find_destination(destination, node = @position, ends = [])
    return if node.nil?

    ends << node if node.location == destination
    node.children.each { |move| find_destination(destination, move, ends) }
    ends
  end

  # finds path from root node(@position) to all nodes with destination
  def find_path(destination, node = @position)
    return if node.nil?

    # if destination found, saves node and recurisvely calls method with next node with destination.
    if node.children.include?(destination)
      @path.unshift(node)
      destination = node
      return if destination == @position

      return find_path(destination, @position)
    end
    node.children.each do |move|
      find_path(destination, move)
    end
  end

  # prints fastest path from start to end position to terminal
  def print_path
    puts "\n\nYou made it in #{@path.length - 1} moves! Here's your path:"
    @path.each { |node| print "#{node.location}\n"}
    puts "\n"
  end
end
