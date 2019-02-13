class Robot
  attr_accessor :bearing, :coordinates

  def initialize
    @bearing = :north
    @coordinates = [7, 3]
  end

  def orient(bearing)
    orientations = %i[east west north south]
    raise ArgumentError unless orientations.include? bearing

    @bearing = bearing
  end

  def turn_right
    right = { east: :south, south: :west, west: :north, north: :east }
    @bearing = right[@bearing]
  end

  def turn_left
    left = { east: :north, north: :west, west: :south, south: :east }
    @bearing = left[@bearing]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

end
