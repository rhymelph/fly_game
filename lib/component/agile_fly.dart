

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class AgileFly extends Fly{

  double get speed => game.tileSize *4.5;


  AgileFly(FlyGame game, double x, double y) : super(game, x, y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize *1.5, game.tileSize *1.5);

    this.flyingSprite = [
      Sprite(A.assetsImagesFliesAgile_fly_1),
      Sprite(A.assetsImagesFliesAgile_fly_2),
    ];
    this.deadSprite = Sprite(A.assetsImagesFliesAgile_fly_dead);
  }

}