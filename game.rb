require 'pry'
require 'gosu'

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each do |file|
  require_relative file
end

class Game < Gosu::Window
  SCREEN_WIDTH = 600
  SCREEN_HEIGHT = 900
  FULL_SCREEN = false

  attr_accessor :bricks, :status
  attr_reader :cursor, :paddle, :ball, :font, :start_button

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, FULL_SCREEN)
    @cursor = Cursor.new(self)
    @status = :menu
    @bricks = Brick.all(self)
    @paddle = Paddle.new(self)
    @ball = Ball.new(self)
    @font = Gosu::Font.new(self, "Arial", SCREEN_HEIGHT / 20)
    start_button_height = SCREEN_HEIGHT * 7 / 10
    @start_button = Button.centered(self, @font, "Click Here To Play!", start_button_height)
  end

  def update
    if status == :menu
      if start_button_clicked
        self.status = :playing
      end
    end

    if button_down?(Gosu::KbEscape)
      close
    end
  end

  def start_button_clicked
    button_down?(Gosu::MsLeft) &&
    start_button.clicked?(mouse_x, mouse_y)
  end

  def draw
    if status == :menu
      draw_centered_text(@font, "Brick Breaker", 10)
      start_button.draw
      cursor.draw
    elsif status == :playing
      draw_centered_text(@font, "Playing", 10)
    end
  end

  def draw_text(font, text, x_coordinate, y_coordinate, color = 0xff_ffffff)
    z_coordinate = 2
    scale_x = 1
    scale_y = 1
    font.draw(text, x_coordinate, y_coordinate, z_coordinate,
              scale_x, scale_y, color)
  end

  def draw_centered_text(font, text, y_coordinate, color = 0xff_ffffff)
    text_width = font.text_width(text)
    unoccupied_width = SCREEN_WIDTH - text_width
    x_coordinate = unoccupied_width / 2
    draw_text(font, text, x_coordinate, y_coordinate, color)
  end
end

game = Game.new
game.show

