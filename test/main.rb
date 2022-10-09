require_relative './scene'

Window.width = 690
Window.height = 690 

title_scene = SpaceBangBang::Scene::Title.new(Image.load('./images/title.png'),
                                              Sound.new('./sounds/title.wav'))
guide_scene = SpaceBangBang::Scene::Guide.new(Image.load('./images/guide.jpg'))
battle_scene = SpaceBangBang::Scene::Battle.new(Image.load('./images/field.jpg'),
                                                Sound.new('./sounds/battle_normal.wav'))
result_scene = SpaceBangBang::Scene::Result.new(Image.load('./images/result.png'))

title_scene.show
guide_scene.show
battle_scene.show
result_scene.show
