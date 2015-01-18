require 'test/unit'
require_relative '../../../src/conway/universe/world'

class WorldTest < Test::Unit::TestCase

  def setup
    @world = World.new(5, 5, [[2, 2], [3, 3]])
  end

  def test_get_cell
    assert_equal(@world.get_map[2][2], @world.get_cell(2, 2))
  end

  def test_cell_live!
    cell = @world.get_cell(4, 4)

    assert_equal(false, cell.alive?)

    @world.cell_live!(cell)

    assert_equal(true, cell.alive?)
  end

  def test_cell_die!
    cell = @world.get_cell(2, 2)

    assert_equal(true, cell.alive?)

    @world.cell_die!(cell)

    assert_equal(false, cell.alive?)
  end

  def test_out_of_bounds
    assert_equal(false, @world.out_of_bounds?(3, 3))
    assert_equal(true, @world.out_of_bounds?(10, 10))
  end

end
