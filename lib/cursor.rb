class Cursor
  IMAGE_FILE = "img/cursor.png"
  attr_reader :window, :image

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, IMAGE_FILE)
  end

  def draw
    image.draw(window.mouse_x, window.mouse_y, 3)
  end
end
