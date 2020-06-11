
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';
import 'package:fly_game/view.dart';

class HelpButton extends BaseComponent{

  HelpButton(FlyGame game)  : super(game) {
    rect = Rect.fromLTWH(
        game.tileSize * .25,
        (game.screenSize.height) - (game.tileSize * 1.25),
        game.tileSize,
        game.tileSize);
    sprite = Sprite(A.assetsImagesUiIcon_help);
  }

  Rect rect;
  Sprite sprite;
  @override
  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);

  }

  @override
  void update(double ca) {
  }


  void onTapDown(){
    game.activeView = View.help;

  }
}