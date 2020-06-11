import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';
import 'package:fly_game/view.dart';

class StartButton extends BaseComponent {
  StartButton(FlyGame game) : super(game) {
    rect = Rect.fromLTWH(
        game.tileSize * 1.5,
        (game.screenSize.height * .75) - (game.tileSize * 1.5),
        game.tileSize * 6,
        game.tileSize * 3);
    sprite = Sprite(A.assetsImagesUiStart_button);
  }

  Rect rect;
  Sprite sprite;

  @override
  void render(Canvas c) {
    sprite.renderRect(c, rect);

  }

  @override
  void update(double c) {}

  void onTapDown(){
    game.score = 0;

    game.activeView = View.playing;
    game.flySpawner.start();
    game.playPlayingBGM();
  }
}
