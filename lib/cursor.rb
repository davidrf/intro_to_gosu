class Cursor
  Z_COORDINATE = 0
  IMAGE_FILE = "img/cursor.png"
  attr_accessor :x_coordinate, :y_coordinate, :image

  def initialize
    @x_coordinate = 0
    @y_coordinate = 0
    @image = Gosu::Image.new(IMAGE_FILE)
  end

  def update_position(game_window)
    self.x_coordinate = game_window.mouse_x
    self.y_coordinate = game_window.mouse_y
  end

  def draw
    image.draw(x_coordinate, y_coordinate, Z_COORDINATE)
  end
end
