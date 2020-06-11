import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class HelpView extends BaseComponent {
  HelpView(FlyGame game) : super(game) {
    titleRect = Rect.fromLTWH(
        game.tileSize *.5,
        (game.screenSize.height / 2) - (game.tileSize * 6),
        game.tileSize * 8,
        game.tileSize * 12);

    titleSprite = Sprite(A.assetsImagesUiDialog_help);

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
