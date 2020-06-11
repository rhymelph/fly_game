import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class Background extends BaseComponent {
  Sprite bgSprite;

  Rect bgRect;

  Background(FlyGame game) : super(game) {
    bgSprite = Sprite(A.assetsImagesBgBackyard);
    bgRect = Rect.fromLTWH(0, game.screenSize.height - game.tileSize * 23,
        game.tileSize * 9, game.tileSize * 23);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double dt) {}
}
