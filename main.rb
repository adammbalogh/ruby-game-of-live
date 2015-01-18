require_relative 'vendor/drawille/lib/drawille'
require_relative 'src/conway/life'
require_relative 'src/conway/universe/world'

# Gosper's Glider Gun
living_ones = [
  [10, 10], [10, 11], [11, 10], [11, 11], 
  [20, 10], [21, 9], [22, 8], [23, 8], [25, 9], [26, 10], [27, 11], [26, 11], [24, 11], [26, 12], [25, 13], [23, 14], [22, 14], [21, 13], [20, 12], [20, 11],
  [30, 10], [31, 10], [30, 9], [31, 9], [30, 8], [31, 8], [32, 7], [34, 6], [34, 7], [34, 11], [34, 12], [32, 11],
  [44, 8], [45, 8], [44, 9], [45, 9]
]

life = Life.new(
    World.new(50, 50, living_ones)
)


Drawille::FlipBook.new.play({fps: 1}) do
  begin
    canvas = Drawille::Canvas.new

    life.each do |cell|
      canvas.set(cell.get_x, cell.get_y) if cell.alive?
    end

    life.evolve!

    sleep(0.1)

    canvas
  rescue Interrupt
    # ctrl + c
  end
end
