import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class HouseFly extends Fly {
  double get speed => game.tileSize *1.5;

  HouseFly(FlyGame game, double x, double y) : super(game, x, y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    this.flyingSprite = [
      Sprite(A.assetsImagesFliesHouse_fly_1),
      Sprite(A.assetsImagesFliesHouse_fly_2),
    ];
    this.deadSprite = Sprite(A.assetsImagesFliesHouse_fly_dead);
  }
}
