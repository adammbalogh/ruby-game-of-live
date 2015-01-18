require_relative 'world'

class Cell

  NEIGHBORS_COORDS = [[-1, -1], [0, -1], [1, -1],
                      [-1,  0],          [1,  0],
                      [-1,  1], [0,  1], [1,  1]]

  # @param x [Integer]
  # @param y [Integer]
  # @param alive [TrueClass|FalseClass]
  def initialize(x, y, alive = false)
    @x = x
    @y = y
    @alive = alive
  end

  def live!
    @alive = true
  end

  def die!
    @alive = false
  end

  # @return [TrueClass|FalseClass]
  def alive?
    @alive
  end

  # @return [Integer]
  def get_x
    @x
  end

  # @return [Integer]
  def get_y
    @y
  end

  # @param world [World]
  # @return [TrueClass|FalseClass]
  def living_next_step?(world)
    result = false

    num_of_neighbors = get_num_of_living_neighbors(world)

    if alive? and (2..3).include?(num_of_neighbors)
      result = true
    elsif not alive? and 3 == num_of_neighbors
      result = true
    end

    result
  end

  # @param world [World]
  # @return [Integer]
  def get_num_of_living_neighbors(world)
    result = 0

    NEIGHBORS_COORDS.each do |x, y|
      if world.out_of_bounds?(@x + x, @y + y)
        next
      elsif world.get_cell(@x + x, @y + y).alive?
        result += 1
      end
    end

    result
  end
end
