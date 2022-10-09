require 'dxruby'

current_angle = 180
board = Sprite.new(100, 100, Image.new(32, 64, C_WHITE))

Window.loop do
    current_angle += 1 if Input.key_down?(K_LEFT)
    current_angle -= 1 if Input.key_down?(K_RIGHT)

    board.angle = current_angle

    board.draw
end
