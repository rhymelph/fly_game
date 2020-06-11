

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class DroolerFly extends Fly{

  double get speed => game.tileSize *2.5;


  DroolerFly(FlyGame game, double x, double y) : super(game, x, y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize*1.25, game.tileSize*1.25);

    this.flyingSprite = [
      Sprite(A.assetsImagesFliesDrooler_fly_1),
      Sprite(A.assetsImagesFliesDrooler_fly_2),
    ];
    this.deadSprite = Sprite(A.assetsImagesFliesDrooler_fly_dead);
  }

}