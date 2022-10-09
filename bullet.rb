class BoundableObject < Sprite
  def initialize(x, y, image, speed, radian, bound_limit)
    super(x, y, image)

    @velocity_x = Math.cos(radian) * speed
    @velocity_y = Math.sin(radian) * speed

    @bound_limit = bound_limit

    setup
  end

  def setup
  end

  def update
    @velocity_x *= -1 if not (0..Window.width).include?(self.x)
    @velocity_y *= -1 if not (0..Window.height).include?(self.y)

    @bound_limit -= 1 if !(0..Window.width).include?(@x) or !(0..Window.height).include?(@y)

    @x += @velocity_x
    @y += @velocity_y

    self
  end

  def is_bound_limit
    return @bound_limit < 0
  end
end

class ItemBox < BoundableObject
  @@speed = 5
  @@boundable_count = 5

  attr_reader :hit

  def initialize(x, y, image)
    super(x, y, image, @@speed, rand(100.0), @@boundable_count)
  end

  def setup
    @hit = false
  end

  def shot(controller)
    @hit = true
    controller.special_bullet = HiSpeedBullet
  end
end

class Bullet < BoundableObject
  @@bullet_speed = 7.0
  @@boundable_count = 3
  @@damage_amount = 1

  attr_reader :source_id

  def initialize(x, y, image, source_id, radian)
    super(x, y, image, @@bullet_speed, radian, @@boundable_count)
    @source_id = source_id
  end

  def shot(controller)
    controller.damage(@@damage_amount)
    # controller.hit_bullet(self)
  end
end

class HiSpeedBullet < BoundableObject
  @@bullet_speed = 14.0
  @@boundable_count = 3
  @@damage_amount = 1

  attr_reader :source_id

  def initialize(x, y, image, source_id, radian)
    super(x, y, image, @@bullet_speed, radian, @@boundable_count)
    @source_id = source_id
  end

  def shot(controller)
    controller.damage(@@damage_amount)
    # controller.hit_bullet(self)
  end
end
