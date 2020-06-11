

import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:fly_game/component/base_component.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';

class MusicButton extends BaseComponent{
  MusicButton(FlyGame game) : super(game){
    rect = Rect.fromLTWH(game.tileSize *.25, game.tileSize * .25, game.tileSize, game.tileSize);

    enableSprite = Sprite(A.assetsImagesUiIcon_music_enabled);
    disableSprite = Sprite(A.assetsImagesUiIcon_music_disabled);

  }

  Rect rect;
  Sprite enableSprite;
  Sprite disableSprite;

  bool isEnable = true;

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
    if(isEnable){
      isEnable = false;
      game.homeBGM.setVolume(0);
      game.playingBGM.setVolume(0);
    }else{
      isEnable = true;
      game.homeBGM.setVolume(.25);
      game.playingBGM.setVolume(.25);
    }
  }

}