class Node
  def initialize(location)
    @location = location
    @adj_nodes = []
  end
  attr_reader :location
  attr_accessor :adj_nodes

  def add_adj_node(adj_node)
    @adj_nodes << adj_node
  end
end