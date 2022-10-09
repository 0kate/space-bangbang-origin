require 'dxruby'

module SpaceBangBang
  module Scene
    class BaseScene
      def initialize(background_image, bgm = nil)
        @background_image = background_image
        @bgm = bgm
        @completed = false
      end

      def show
        @bgm.play if @bgm
        setup

        Window.loop do
          Window.draw(0, 0, @background_image)
          check_events
          render
          break if @completed
        end

        @bgm.stop if @bgm
        teardown
      end

      def setup
      end

      def check_events
      end

      def render
      end

      def teardown
      end
    end

    class Title < BaseScene
      def check_events
        @completed = Input.key_push?(K_SPACE)
      end

      def render
      end
    end

    class Guide < BaseScene
      def check_events
        @completed = Input.key_push?(K_SPACE)
      end
    end

    class Battle < BaseScene
      @@keybinds = {
        # keybinds for controller red
        K_Z => { :controller => :red, :action => :move_right },
        K_Q => { :controller => :red, :action => :move_left },
        K_X => { :controller => :red, :action => :turn_right },
        K_W => { :controller => :red, :action => :turn_left },
        K_LSHIFT => { :controller => :red, :action => :shot },
        # keybinds for controller blue
        K_DOWN  => { :controller => :blue, :action => :move_right },
        K_UP    => { :controller => :blue, :action => :move_left },
        K_RIGHT => { :controller => :blue, :action => :turn_right },
        K_LEFT  => { :controller => :blue, :action => :turn_left },
        K_RETURN => { :controller => :blue, :action => :shot },
        # keybinds for controller green
        K_B => { :controller => :green, :action => :move_right },
        K_V => { :controller => :green, :action => :move_left },
        K_H => { :controller => :green, :action => :turn_right },
        K_F => { :controller => :green, :action => :turn_left },
        K_SPACE => { :controller => :green, :action => :shot},
        # keybinds for controller yellow
      }

      def inititalize(background_image, bgm = nil, controllers = {})
        super(background_image, bgm)
        @controllers = controllers
      end

      def check_events
        @completed = Input.key_push?(K_RETURN)

        @@keybinds.each do |key, action|
          if Input.key_push?(key)
            target_controller = action[:controller]
            action = action[:action]

            target_controller.method(action).call
          end
        end
      end

      def render
        @controllers.valus.each do |controller|
          controller.update.draw
          controller.bullets.each { |bullet| bullet.update.draw }
        end
      end
    end

    class Result < BaseScene
    end
  end
end
