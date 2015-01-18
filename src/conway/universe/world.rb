require_relative 'cell'

class World

  # @param width [Integer]
  # @param height [Integer]
  # @param living_ones [Array] [[1, 2], [3, 5], ...]
  def initialize(width, height, living_ones)
    @width = width
    @height = height
    @map = Array.new(width) { |x| Array.new(height) { |y| Cell.new(x, y) } }

    set_living_ones!(living_ones)
  end

  # @return [Array] [[1, 2], [3, 5], ...]
  def get_map
    @map
  end

  # @return [Cell]
  def get_cell(x, y)
    @map[x][y]
  end

  # @param cell [Cell]
  def cell_live!(cell)
    @map[cell.get_x][cell.get_y].live!
  end

  # @param cell [Cell]
  def cell_die!(cell)
    @map[cell.get_x][cell.get_y].die!
  end

  def each
    @map.each do |row|
      row.each do |cell|
        yield cell
      end
    end
  end

  # @param living_ones [Array] [[1, 2], [3, 5], ...]
  def set_living_ones!(living_ones)
    living_ones.each do |x, y|
      @map[x][y].live!
    end
  end

  # @return [TrueClass|FalseClass]
  def out_of_bounds?(x, y)
    not (0..@width - 1).include?(x) or not (0..@height - 1).include?(y)
  end
end
