require 'dxruby'
require_relative './base'
require_relative '../controller'

module SpaceBangBang
  module Scene
    class Battle < BaseScene
      @@keybinds = []
      @@controller_info_options = {
        :red => {
          :pos_x => 80,
          :pos_y => 80,
          :color => [255, 132, 132],
          :angle => 90,
        },
        :blue => {
          :pos_x => 590,
          :pos_y => 590,
          :color => [147, 147, 255],
          :angle => 270,
        },
        :green => {
          :pos_x => 100,
          :pos_y => 590,
          :color => [191, 255, 127],
          :angle => 360,
        },
        :yellow => {
          :pos_x => 590,
          :pos_y => 80,
          :color => [255, 191, 127],
          :angle => 180,
        },
      }

      def self.load_keybinds(keybinds)
        @@keybinds = keybinds
      end

      def count_down
        loop_count = 180
        count_font = Font.new(50)

        Window.loop do
          loop_count -= 1
          Window.draw_font(335, 335, (loop_count / 60 + 1).to_s, count_font)

          break if loop_count < 6
        end
      end

      def controllers=(controllers_list)
        @controllers = controllers_list.map { |controller| [controller.id, controller] }.to_h
      end

      def setup
        @controller_info_font = Font.new(32)
        @bullets = []
        @item_boxes = []

        count_down
      end

      def draw_controller_info(controller)
        controller_info_option = @@controller_info_options[controller.id]

        controllers_bullets = @bullets.filter { |bullet| bullet.source_id == controller.id }
        remaining_bullets = Controller.bullets_limit - controllers_bullets.length

        Window.draw_font(controller_info_option[:pos_x],
                         controller_info_option[:pos_y], 
                         "Bullets: #{remaining_bullets.to_s}",
                         @controller_info_font,
                         color: controller_info_option[:color],
                         angle: controller_info_option[:angle])

        Window.draw_font(controller_info_option[:pos_x],
                         controller_info_option[:pos_y] + 30,
                         "Life: #{controller.life.to_s}",
                         @controller_info_font,
                         color: controller_info_option[:color],
                         angle: controller_info_option[:angle])
      end

      def action_hook(action_type, result)
        case action_type
        when :shot
          new_bullet = result
          shooters_bullets = @bullets.filter { |bullet| bullet.source_id == new_bullet.source_id }

          if shooters_bullets.length < Controller.bullets_limit
            @bullets << result
          end
        end
      end

      def check_events
        @@keybinds.each do |keybind|
          if Input.method(keybind[:check]).call(keybind[:key])
            action = keybind[:action]

            target_controller = @controllers[action[:controller]]
            action_type = action[:type]

            result = target_controller.method(action_type).call
            action_hook(action_type, result)
          end
        end

        threshold = rand(120.0) % 80.0
        if threshold == 0.0
          @item_boxes << ItemBox.new(100, 100, Image.new(10, 10))
        end

        Sprite.check(@bullets, @controllers.values)
        Sprite.check(@item_boxes, @controllers.values)
      end

      def render
        @controllers.values.each do |controller|
          controller.draw
          draw_controller_info(controller)
        end

        @bullets = @bullets.filter { |bullet| !bullet.is_bound_limit }
        @bullets.each { |bullet| bullet.update.draw }

        @item_boxes = @item_boxes.filter { |item_box| !item_box.is_bound_limit && !item_box.hit }
        @item_boxes.each { |item_box| item_box.update.draw }
      end

      def completed?
        @controllers.values.filter { |controller| !controller.dead }.length < 2
      end
    end
  end
end
