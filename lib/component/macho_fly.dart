import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class MachoFly extends Fly {
  double get speed => game.tileSize * 10;

  MachoFly(FlyGame game, double x, double y) : super(game, x, y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);

    this.flyingSprite = [
      Sprite(A.assetsImagesFliesMacho_fly_1),
      Sprite(A.assetsImagesFliesMacho_fly_2),
    ];
    this.deadSprite = Sprite(A.assetsImagesFliesMacho_fly_dead);
  }
}
