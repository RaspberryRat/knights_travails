class Move_Node
  def initialize(location)
    @location = location
    @child = nil
    @right = nil
  end
  attr_reader :location
  attr_accessor :child, :right
end