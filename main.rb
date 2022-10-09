require 'dxruby'

require_relative './bullet'
require_relative './controller'
require_relative './guide'
require_relative './keybinds'
require_relative './scene/title'
require_relative './scene/guide'
require_relative './scene/battle'
require_relative './scene/result'

# Window.x = 300
# Window.y = 20
Window.width = 690
Window.height = 690 

$controller_speed = 3
$controller_options = [
  {
    :id => :red,
    :pos_x => 20,
    :pos_y => 335,
    :image => Image.load('image/player1.png'),
    :speed => $controller_speed,
    :angle => 0,
    :direction => SpaceBangBang::MoveDirection::VERTICAL,
    :pos_x_range => (20..20),
    :pos_y_range => (100..590),
    :angle_range => (-80..80),
  },
  {
    :id => :blue,
    :pos_x => 650,
    :pos_y => 335,
    :image => Image.load('image/player2.png'),
    :speed => $controller_speed,
    :angle => 180,
    :direction => SpaceBangBang::MoveDirection::VERTICAL,
    :pos_x_range => (650..650),
    :pos_y_range => (100..590),
    :angle_range => (100..260),
  },
  {
    :id => :green,
    :pos_x => 335,
    :pos_y => 650,
    :image => Image.load('image/player3.png'),
    :speed => $controller_speed,
    :angle => 270,
    :direction => SpaceBangBang::MoveDirection::HORIZONTAL,
    :pos_x_range => (100..590),
    :pos_y_range => (650..650),
    :angle_range => (190..350),
  },
  {
    :id => :yellow,
    :pos_x => 335,
    :pos_y => 20,
    :image => Image.load('image/player4.png'),
    :speed => $controller_speed,
    :angle => 90,
    :direction => SpaceBangBang::MoveDirection::HORIZONTAL,
    :pos_x_range => (100..590),
    :pos_y_range => (20..20),
    :angle_range => (190..350),
  },
]

def main
  controllers = $controller_options.map do |option|
    SpaceBangBang::Controller.new(option[:id],
                                  option[:pos_x],
                                  option[:pos_y],
                                  option[:image],
                                  option[:speed],
                                  option[:angle],
                                  option[:direction],
                                  option[:pos_x_range],
                                  option[:pos_y_range],
                                  option[:angle_range])
  end

  title_scene = SpaceBangBang::Scene::Title.new(Image.load('./image/title.png'),
                                                Sound.new('./bgm/title_music.wav'))

  guide_scene = SpaceBangBang::Scene::Guide.new(Image.load('./image/guide.jpg'))

  SpaceBangBang::Scene::Battle.load_keybinds(SpaceBangBang::Config::Keybinds)
  battle_scene = SpaceBangBang::Scene::Battle.new(Image.load('./image/field.jpg'),
                                                  Sound.new('./bgm/battle_music_start.wav'))
  battle_scene.controllers = controllers

  result_scene = SpaceBangBang::Scene::Result.new(Image.load('./image/ending.png'))

  while true
    title_scene.start
    guide_scene.start
    battle_scene.start

    # result_scene.set_winner(PLAYER_COLOR[$winner_id])
    # status = result_scene.start

    # next if status == ResultSceneStatus::RESTART
  end
end

main
