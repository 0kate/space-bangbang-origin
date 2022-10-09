module SpaceBangBang
  module Scene
    class BaseScene
      def initialize(background_image, bgm = nil)
        @background_image = background_image
        @bgm = bgm
      end

      def start
        if @bgm
          @bgm.loop_count = -1 
          @bgm.play
        end
        setup

        Window.loop do
          Window.draw(0, 0, @background_image)
          check_events
          render
          break if completed?
        end

        @bgm.stop if @bgm
        teardown

        status
      end

      def setup
      end

      def check_events
      end

      def render
      end

      def completed?
      end

      def teardown
      end

      def status
      end
    end
  end
end
