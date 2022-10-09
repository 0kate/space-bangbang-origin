require 'dxruby'

require_relative './bullet'

module SpaceBangBang
  module MoveDirection
    VERTICAL   = 0
    HORIZONTAL = 1
  end

  class Controller < Sprite
    @@image_height = 20
    @@image_width  = 20
    @@dead_color   = [0, 0, 0, 0]
    @@angle_delta  = 2
    @@bullets_limit = 5

    attr_reader :id, :speed, :angle, :dead, :bullets, :life

    def self.bullets_limit
      @@bullets_limit
    end

    def initialize(id, pos_x, pos_y, image, speed, angle, direction, pos_x_range, pos_y_range, angle_range)
      super(pos_x, pos_y, image)

      @id = id
      @speed = speed
      @angle = angle
      @direction = direction
      @pos_x_range = pos_x_range
      @pos_y_range = pos_y_range
      @angle_range = angle_range

      @life = 3
      @dead = false
      @latest_hit = nil

      @bullet_image = Image.load("image/player_#{@id}_bullet.png")
      @special_bullet = nil
    end

    def special_bullet=(special_bullet)
      @special_bullet = special_bullet
    end

    def move_horizontal?
      @direction == MoveDirection::HORIZONTAL
    end

    def move_right
      if move_horizontal?
        @x += @speed if @pos_x_range.include?(@x + @speed)
      else
        @y -= @speed if @pos_y_range.include?(@y - @speed)
      end
    end

    def move_left
      if move_horizontal?
        @x -= @speed if @pos_x_range.include?(@x - @speed)
      else
        @y += @speed if @pos_y_range.include?(@y + @speed)
      end
    end

    def turn_right
      @angle += @@angle_delta if @angle_range.include?(@angle + @@angle_delta)
    end

    def turn_left
      @angle -= @@angle_delta if @angle_range.include?(@angle - @@angle_delta)
    end

    def shot
      bullet_class = Bullet
      if @special_bullet
        bullet_class = @special_bullet
        @special_bullet = nil
      end
      bullet_radian = @angle / 180.0 * Math::PI

      bullet_class.new(@x, @y, @bullet_image, @id, bullet_radian)
    end

    def damage(amount)
      @life -= if @life < amount then @life else amount
    end

    def hit_bullet(bullet)
      current_time = Time.now
      valid_hit = (@latest_hit == nil) || (current_time - @latest_hit[:time] > 0.5)
      is_enemys_bullet = @id != bullet.source_id

      if valid_hit && is_enemys_bullet
        @life -= 1
        @latest_hit = { :bullet => bullet, :time => current_time }
      end

      if @life < 1
        @image = Image.new(@@image_height, @@image_width, @@dead_color)
        @dead = true
      end
    end

    # def hit(other)
    #   if @dead
    #     return
    #   end
    #   other.effect(self)
    # end
  end
end
