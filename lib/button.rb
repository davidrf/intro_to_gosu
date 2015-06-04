class Button
  attr_reader :window, :font, :text, :x_value, :y_value, :color

  def initialize(window, font, text, x_value, y_value, color = 0xff_ffffff)
    @window = window
    @font = font
    @text = text
    @x_value = x_value
    @y_value = y_value
    @color = color
  end

  def draw
    z_value = 1
    scale_x = 1
    scale_y = 1
    font.draw(text, x_value, y_value, z_value,
              scale_x, scale_y, color)
  end

  def clicked?(clicked_x_value, clicked_y_value)
    clicked_x_value >= left_boundary &&
    clicked_x_value <= right_boundary &&
    clicked_y_value >= bottom_boundary &&
    clicked_y_value <= top_boundary
  end

  def height
    font.height
  end

  def width
    font.text_width(text)
  end

  def left_boundary
    x_value
  end

  def right_boundary
    x_value + width
  end

  def bottom_boundary
    y_value
  end

  def top_boundary
    y_value + height
  end

  def self.centered(window, font, text, y_value, color = 0xff_ffffff)
    text_width = font.text_width(text)
    unoccupied_width = window.width - text_width
    x_value = unoccupied_width / 2
    Button.new(window, font, text, x_value, y_value, color)
  end
end

