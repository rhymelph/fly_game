import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class LostView extends BaseComponent {
  LostView(FlyGame game) : super(game) {
    titleRect = Rect.fromLTWH(
        game.tileSize,
        game.screenSize.height / 2 - game.tileSize * 5,
        game.tileSize * 7,
        game.tileSize * 5);
    titleSprite = Sprite(A.assetsImagesBgLose_splash);
  }

  Rect titleRect;
  Sprite titleSprite;

  @override
  void render(Canvas canvas) {
    titleSprite.renderRect(canvas, titleRect);
  }

  @override
  void update(double ca) {}
}
