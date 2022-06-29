# Node class are graph vertices or locations on board for knight to move
class Node
  def initialize(location)
    @location = location
    @children = []
  end
  attr_reader :location
  attr_accessor :children

  def add_children(node)
    @children << node
  end
end
