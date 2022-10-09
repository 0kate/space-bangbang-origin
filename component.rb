require 'dxruby'

module SpaceBangBang
  class Component < Sprite
    def initialize(pos_x, pos_y, x_range, y_range, image)
      super(pos_x, pos_y, image)

      @pos_x = pos_x
      @pos_y = pos_y
      @x_range = x_range
      @y_range = y_range
    end

    def update
    end

    def movable?
      @x_range.include?(@pos_x) && @y_range.include(@pos_y)
    end
  end
end
