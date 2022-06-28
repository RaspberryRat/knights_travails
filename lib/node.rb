# Node class are graph vertices or locations on board for knight to move
class Node
  def initialize(location)
    @location = location
    @possible_nodes = []
  end
  attr_reader :location
  attr_accessor :possible_nodes

  def add_next_node(possible_node)
    @possible_nodes << possible_node
  end
end
