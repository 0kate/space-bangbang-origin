require 'dxruby'

module SpaceBangBang
  module Component
    class BaseComponent < Sprite
      def initialize(pos_x, pos_y, image)
        super(pos_x, pos_y, image)
      end

      def updatable?
        true
      end

      def update
      end

      def render
        update if updatable?
      end
    end

    class Controller < BaseComponent
      def initialize(pos_x, pos_y, image, speed, angle, keybinds = {})
        super(pos_x, pos_y, image)

        @dead = false
        @keybinds = keybinds
        @speed = speed
        @angle = angle
      end

      def updatable?
        !@dead
      end

      def update
        if @keybinds.member?(:move_right) && Input.key_push?(@keybinds[:move_right])
        end

        if @keybinds.member?(:move_left) && Input.key_push?(@keybinds[:move_left])
        end

        if @keybinds.member?(:turn_right) && Input.key_push?(@keybinds[:turn_right])
        end

        if @keybinds.member?(:turn_left) && Input.key_push?(@keybinds[:turn_left])
        end

        if @keybinds.member?(:shot_bullet) && Input.key_push?(@keybinds[:show_bullet])
        end
      end

      def hit(other)
        if other.class == Bullet
          @dead = true
        end
      end
    end

    class Bullet < BaseComponent
      def initialize(pos_x, pos_y, image)
        super(pos_x, pos_y, image)
      end

      def updatable?
      end

      def update
      end
    end
  end
end
