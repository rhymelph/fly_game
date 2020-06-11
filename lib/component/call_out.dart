import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/generated/a.dart';
import 'package:fly_game/view.dart';

class CallOut {
  final Fly fly;
  Rect rect;
  Sprite sprite;
  double value;

  TextPainter tp;
  TextStyle textStyle;
  Offset textOffset;

  CallOut(this.fly) {
    sprite = Sprite(A.assetsImagesUiCallout);
    value = 1;
    tp = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
  }

  void render(Canvas canvas) {
    rect = Rect.fromLTWH(
        fly.flyRect.left - (fly.game.tileSize * .25),
        fly.flyRect.top - fly.game.tileSize * .5,
        fly.game.tileSize * .75,
        fly.game.tileSize * .75);
    sprite.renderRect(canvas, rect);
    if(tp.text?.text !=null){
      tp.layout();
      tp.paint(canvas, textOffset);
    }
  }

  void update(double ca) {
    if (fly.game.activeView == View.playing) {
      value = value - .05 * ca;
      if (value <= 0) {
        if(fly.game.soundButton.isEnable){
          Flame.audio.play('sfx/haha${fly.game.rad.nextInt(5)+1}.ogg');
        }
        fly.game.activeView = View.lost;
        fly.game.playHomeBGM();
      }
    }
    rect = Rect.fromLTWH(
        fly.flyRect.left - (fly.game.tileSize * .25),
        fly.flyRect.top - fly.game.tileSize * .5,
        fly.game.tileSize * .75,
        fly.game.tileSize * .75);

    tp.text = TextSpan(
      text: (value * 10).toInt().toString(),
      style: textStyle,
    );
    tp.layout();
    textOffset = Offset(rect.center.dx - (tp.width / 2),
        rect.top + (rect.height * .4) - (tp.height / 2));
  }
}
