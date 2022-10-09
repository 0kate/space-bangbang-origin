require 'dxruby'
require_relative './base'

module SpaceBangBang
  module Scene
    class Title < BaseScene
      def setup
        @start_msg = 'Press SPACE to start game'
        @start_msg_font = Font.new(40)
        @start_msg_pos = { :x => 110, :y => 450 }
        @frame_count = 0
      end

      def render
        @frame_count += 1
        if @frame_count <= 30
          Window.draw_font(@start_msg_pos[:x],
                           @start_msg_pos[:y],
                           @start_msg,
                           @start_msg_font)
        end

        @frame_count %= 60
      end

      def completed?
        Input.key_push?(K_SPACE)
      end
    end
  end
end
