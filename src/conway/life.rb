require_relative 'universe/world'

class Life

  # @param world [World]
  def initialize(world)
    @world = world
  end

  def evolve!
    go_alive_next_step = []
    go_dead_next_step = []

    @world.each do |cell|
      if cell.living_next_step?(@world)
        go_alive_next_step.push(cell)
      else
        go_dead_next_step.push(cell)
      end
    end

    go_alive_next_step.each do |cell|
      @world.cell_live!(cell)
    end

    go_dead_next_step.each do |cell|
      @world.cell_die!(cell)
    end
  end

  def each
    @world.each do |cell|
      yield cell
    end
  end
end
