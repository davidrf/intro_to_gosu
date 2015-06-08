class Ball
  Z_COORDINATE = 0
  IMAGE_FILE = "img/ball.gif"
  attr_accessor :image, :x_coordinate, :y_coordinate, :velocity_x, :velocity_y

  def initialize(x_coordinate, y_coordinate)
    @image = Gosu::Image.new(IMAGE_FILE)
    @x_coordinate = adjust_x_coordinate(x_coordinate)
    @y_coordinate = adjust_y_coordinate(y_coordinate)
    @velocity_x = 0.1
    @velocity_y = -0.1
  end

  def update_position(change_in_time)
    self.x_coordinate = x_coordinate + velocity_x * change_in_time
    self.y_coordinate = y_coordinate + velocity_y * change_in_time
  end

  def change_in_x(change_in_time)
    velocity_x * change_in_time
  end

  def change_in_y(change_in_time)
    velocity_y * change_in_time
  end

  def draw
    image.draw(x_coordinate, y_coordinate, Z_COORDINATE)
  end

  def image_width
    @image.width
  end

  def image_height
    @image.height
  end

  private

  def adjust_x_coordinate(x_coordinate)
    x_coordinate - image_width / 2
  end

  def adjust_y_coordinate(y_coordinate)
    y_coordinate - image_height / 2
  end
end
