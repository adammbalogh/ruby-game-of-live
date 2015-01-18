require 'test/unit'
require_relative '../../../src/conway/universe/cell'
require_relative '../../../src/conway/universe/world'

class CellTest < Test::Unit::TestCase

  def test_is_alive?
    assert_equal(true, Cell.new(0, 0, true).alive?)
    assert_equal(false, Cell.new(0, 0, false).alive?)
  end

  def test_live!
    cell = Cell.new(0, 0, false)
    cell.live!

    assert_equal(true, cell.alive?)
  end

  def test_die!
    cell = Cell.new(0, 0, true)
    cell.die!

    assert_equal(false, cell.alive?)
  end

  def test_position
    cell = Cell.new(15, 10, true)

    assert_equal(15, cell.get_x)
    assert_equal(10, cell.get_y)
  end

  def test_living_next_step?
    cell = Cell.new(0, 0, true)
    world = World.new(5, 5, [[1, 0], [2, 0], [3, 0]])

    assert_equal(false, cell.living_next_step?(world))

    cell = Cell.new(2, 0, true)
    assert_equal(true, cell.living_next_step?(world))
  end

  def test_get_num_of_living_neighbors
    cell = Cell.new(2, 0, true)
    world = World.new(5, 5, [[1, 0], [2, 0], [3, 0]])

    assert_equal(2, cell.get_num_of_living_neighbors(world))
  end

end
