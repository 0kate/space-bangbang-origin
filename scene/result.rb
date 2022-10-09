require 'dxruby'
require_relative './base'

module SpaceBangBang
  module Scene
    module ResultSceneStatus
      RESTART = 0
      END_GAME = 1
    end

    class Result < BaseScene
      def set_winner(winner)
        @result_msg = "#{winner}が宇宙を整復した！"
      end

      def setup
        @result_msg = ''
        @result_msg_font = Font.new(40)
        @result_msg_pos = { :x => 155, :y => 150 }

        @action_msg_font = Font.new(25)
        @restart_msg = 'Press SPACE to restart game'
        @restart_msg_pos = { :x => 185, :y => 450 }
        @end_game_msg = 'Press ESC to end game'
        @end_game_msg_pos = { :x => 185, :y => 500 }

        @do_restart = false
        @do_end_game = false
      end

      def render
        Window.draw_font(@result_msg_pos[:x],
                         @result_msg_pos[:y],
                         @result_msg,
                         @result_msg_font)

        Window.draw_font(@restart_msg_pos[:x],
                         @restart_msg_pos[:y],
                         @restart_msg,
                         @action_msg_font)

        Window.draw_font(@end_game_msg_pos[:x],
                         @end_game_msg_pos[:y],
                         @end_game_msg,
                         @action_msg_font)
      end

      def completed?
        @do_restart = Input.key_push?(K_ESCAPE)
        @do_end_game = Input.key_push?(K_SPACE)

        @do_restart || @do_end_game
      end

      def status
        return ResultSceneStatus::RESTART if @do_restart
        return ResultSceneStatus::END_GAME if @do_end_game
      end
    end
  end
end
