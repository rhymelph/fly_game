import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class HomeView extends BaseComponent {
  HomeView(FlyGame game) : super(game) {
    titleRect = Rect.fromLTWH(
        game.tileSize,
        (game.screenSize.height / 2) - (game.tileSize * 4),
        game.tileSize * 7,
        game.tileSize * 4);

    titleSprite = Sprite(A.assetsImagesBrandingTitle);

  }

  Rect titleRect;
  Sprite titleSprite;

  @override
  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);

  }

  @override
  void update(double t) {}
}
