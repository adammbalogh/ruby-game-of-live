require 'test/unit'
require_relative '../../src/conway/universe/cell'
require_relative '../../src/conway/universe/world'
require_relative '../../src/conway/life'

class LifeTest < Test::Unit::TestCase

  def test_evolve!
    world = World.new(5, 5, [[1, 0], [2, 0], [3, 0]])
    life = Life.new(world)

    life.evolve!

    assert_equal(false, world.get_cell(1, 0).alive?)
    assert_equal(true, world.get_cell(2, 0).alive?)
  end

end
