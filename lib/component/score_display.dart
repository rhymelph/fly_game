import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';

class ScoreDisplay extends BaseComponent {
  ScoreDisplay(FlyGame game) : super(game) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    textStyle = TextStyle(color: Color(0xFFFFFFFF), fontSize: 90, shadows: [
      Shadow(
        blurRadius: 7,
        color: Colors.black,
        offset: Offset(3, 3),
      )
    ]);

    position = Offset.zero;
  }

  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  @override
  void render(Canvas canvas) {
    painter?.paint(canvas, position);
  }

  @override
  void update(double ca) {
    if ((painter.text?.text ?? '') != game.score.toString()) {
      painter.text = TextSpan(
        text: game.score.toString(),
        style: textStyle,
      );
    }
    painter.layout();

    position = Offset(game.screenSize.width / 2 - painter.width / 2,
        game.screenSize.height * .25 - painter.height / 2);
  }
}
