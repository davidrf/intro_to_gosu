class Brick
  def initialize(window)
    @window = window

  end

  def draw

  end

  def self.all(window, number_of_bricks = 1)
    bricks = []
    number_of_bricks.times do
      bricks << Brick.new(window)
    end
    bricks
  end
end
