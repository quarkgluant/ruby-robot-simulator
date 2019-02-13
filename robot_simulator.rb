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

  def advance
    one_case = { east: [1, 0], north: [0, 1], west: [-1, 0], south: [0, -1] }
    @coordinates[0] += one_case[@bearing][0]
    @coordinates[1] += one_case[@bearing][1]
  end

end

class Simulator
  attr_accessor :robot

  def instructions(directions)
    instructions = { 'L' => :turn_left , 'A' => :advance, 'R' => :turn_right }
    output = []
    directions.split('').each { | direction| output << instructions[direction] }
    output
  end

  def place(robot, x: a, y: b ,direction: dir)
    robot.at(x, y)
    robot.bearing = direction
  end
  def evaluate(robot, instruct)
  instructions(instruct).each { | direction| robot.send(direction) }
  end
end
