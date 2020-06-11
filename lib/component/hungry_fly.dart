

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class HungryFly extends Fly{

  double get speed => game.tileSize *5;

  HungryFly(FlyGame game, double x, double y) : super(game, x, y){
    flyRect = Rect.fromLTWH(x, y, game.tileSize*1.65, game.tileSize*1.65);

    this.flyingSprite = [
      Sprite(A.assetsImagesFliesHungry_fly_1),
      Sprite(A.assetsImagesFliesHungry_fly_2),
    ];
    this.deadSprite = Sprite(A.assetsImagesFliesHungry_fly_dead);
  }

}