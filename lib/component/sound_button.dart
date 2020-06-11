

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class SoundButton extends BaseComponent{
  SoundButton(FlyGame game) : super(game){
    rect = Rect.fromLTWH(game.tileSize * 1.5, game.tileSize *.25, game.tileSize, game.tileSize);
    enableSprite = Sprite(A.assetsImagesUiIcon_sound_enabled);
    disableSprite = Sprite(A.assetsImagesUiIcon_sound_disabled);

  }

  Rect rect;
  Sprite enableSprite;
  Sprite disableSprite;

  bool isEnable = false;

  @override
  void render(Canvas canvas) {
    if(isEnable){
      enableSprite.renderRect(canvas, rect);
    }else{
      disableSprite.renderRect(canvas, rect);
    }
  }

  @override
  void update(double ca) {

  }

  void onTapDown(){
    isEnable = ! isEnable;
  }

}