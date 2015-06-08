class Paddle
  Y_COORDINATE = 800
  Z_COORDINATE = 0
  IMAGE_FILE = "img/paddle.png"
  attr_accessor :x_coordinate, :image

  def initialize
    @x_coordinate = 0
    @image = Gosu::Image.new(IMAGE_FILE)
  end

  def update_position(game_window)
    mouse_x_coordinate = game_window.mouse_x
    self.x_coordinate = mouse_x_coordinate - half_image_width
  end

  def draw
    image.draw(x_coordinate, Y_COORDINATE, Z_COORDINATE)
  end

  def image_width
    @image.width
  end

  def half_image_width
    image_width / 2
  end
end
