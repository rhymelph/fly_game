import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';

class HighscoreDisplay extends BaseComponent {
  HighscoreDisplay(FlyGame game) : super(game) {
    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    Shadow shadow = Shadow(
      blurRadius: 3,
      color: Colors.black,
      offset: Offset.zero,
    );
    textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      shadows: [shadow, shadow, shadow, shadow],
    );

    updateHighScore();
  }

  TextPainter textPainter;
  Offset offset;
  TextStyle textStyle;

  @override
  void render(Canvas canvas) {
    textPainter.paint(canvas, offset);
  }

  void updateHighScore() {
    int highScore = game.preferences.getInt("highScore") ?? 0;

    textPainter.text = TextSpan(
      text: '最高分：$highScore',
      style: textStyle,
    );
    textPainter.layout();
    offset = Offset(
        game.screenSize.width - game.tileSize * .25 - textPainter.width,
        game.tileSize * .25);
  }

  @override
  void update(double ca) {}
}
