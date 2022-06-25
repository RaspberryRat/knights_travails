class Node
  def initialize(location)
    @location = location
    @neighbours = []
  end
  attr_reader :location
  attr_accessor :neighbours

  def add_neighbour(neighbour)
    @neighbours << neighbour
  end
end