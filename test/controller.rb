require 'dxruby'
require_relative './bullet'

module SpaceBangBang
  module MoveDirection
    VERTICAL   = 0
    HORIZONTAL = 1
  end

  class Controller < Sprite
    def initialize(pos_x, pos_y, image, direction)
      super(pos_x, pos_y, image)
      @direction = direction
      @bullets = []
    end

    def update
      self
    end

    def move_right
      if @direction == MoveDirection::VERTICAL
        @pos_y += 1
      elsif
        @pos_x -= 1
      end
    end

    def move_left
      if @direction == MoveDirection::VERTICAL
        @pos_y -= 1
      elsif
        @pos_x += 1
      end
    end

    def turn_right
    end

    def turn_left
    end

    def shot
      @bullet << Bullet.new()
    end
  end
end
