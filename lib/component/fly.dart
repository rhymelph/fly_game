import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/component/call_out.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/view.dart';

class Fly extends BaseComponent {
  Rect flyRect;

//  Paint flyPaint;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  bool isDead = false;

  //是否在屏幕外，死掉的
  bool isOffScreen = false;

  //移动速度
  double get speed => game.tileSize * 3;
  //目标位置
  Offset targetLocation;

  //倒计时
  CallOut callOut;

  Fly(FlyGame game, double x, double y) : super(game) {
    updateTargetLocation();
    callOut = CallOut(this);

  }

  void updateTargetLocation(){
    double x = game.rad.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rad.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

//  {
//    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
////    flyPaint = Paint()
////    ..color = Color(0xff6ab84c);
//  }

  void render(Canvas canvas) {
    if (isDead) {
      deadSprite.renderRect(canvas, flyRect.inflate(2));
    } else {
      if(game.activeView == View.playing){
        callOut.render(canvas);
      }
      flyingSprite[flyingSpriteIndex.toInt().clamp(0, 1)]
          .renderRect(canvas, flyRect.inflate(2));
    }
//    canvas.drawRect(flyRect, flyPaint);
  }

  // t 为刷新时间
  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 6 * t);
    } else {
      if(game.activeView == View.playing)       callOut.update(t);

      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }

      //移动速度计算出来的应该移动的距离
      double stepDistance = speed * t;
      //目标位置减去原来的位置
      Offset toTarget = targetLocation -Offset(flyRect.left, flyRect.top);
      // 是否到达位置
      if(stepDistance < toTarget.distance){
        // 没有到达，计算出应该到达的点
        Offset setToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
        //移动矩阵
        flyRect = flyRect.shift(setToTarget);
      }else{
        //移动矩阵
        flyRect = flyRect.shift(toTarget);
        //重新获取新的位置
        updateTargetLocation();
      }
    }

    if (flyRect.top > game.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
//    flyPaint.color = Colors.red;
    isDead = true;
    if(game.activeView == View.playing){
      game.score +=1;
      if(game.soundButton.isEnable){
        Flame.audio.play('sfx/ouch${(game.rad.nextInt(11)+1)}.ogg');
      }
    }
    if(game.score > (game.preferences.getInt("highScore")??0)){
      game.preferences.setInt('highScore', game.score);
      game.highscoreDisplay.updateHighScore();
    }
//    game.spawnFly();
  }
}
