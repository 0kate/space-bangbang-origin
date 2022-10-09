require 'dxruby'
module SpaceBangBang
  class Bullet < Sprite
    def initialize(pos_x, pos_y, image, owner)
      super(pos_x, pos_y, image)
      @owner = owner
    end

    def update
      self
    end
  end
end
