def guide_screen
  guide_image = Image.load('image/guide.jpg')

  Window.loop do
    Window.draw(0, 0, guide_image)
    break if Input.key_push?(K_SPACE)
  end
end
