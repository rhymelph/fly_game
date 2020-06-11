import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_game/game.dart';
import 'package:fly_game/generated/a.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //全屏
  await Flame.util.fullScreen();

  //设置屏幕方向
  await Flame.util.setOrientation(DeviceOrientation.portraitUp);

  //加载资源
  await Flame.images.loadAll([
    A.assetsImagesFliesDrooler_fly_2,
    A.assetsImagesFliesDrooler_fly_1,
    A.assetsImagesFliesHungry_fly_dead,
    A.assetsImagesFliesHouse_fly_dead,
    A.assetsImagesFliesAgile_fly_dead,
    A.assetsImagesFliesDrooler_fly_dead,
    A.assetsImagesFliesAgile_fly_2,
    A.assetsImagesFliesMacho_fly_2,
    A.assetsImagesFliesHouse_fly_2,
    A.assetsImagesFliesAgile_fly_1,
    A.assetsImagesFliesMacho_fly_1,
    A.assetsImagesFliesHouse_fly_1,
    A.assetsImagesFliesMacho_fly_dead,
    A.assetsImagesFliesHungry_fly_2,
    A.assetsImagesFliesHungry_fly_1,
    A.assetsImagesBgBackyard,
    A.assetsImagesUiDialog_credits,
    A.assetsImagesUiDialog_help,
    A.assetsImagesUiIcon_credits,
    A.assetsImagesUiIcon_help,
    A.assetsImagesUiStart_button,
    A.assetsImagesBrandingTitle,
    A.assetsImagesBgLose_splash,
    A.assetsImagesUiCallout,
    //音乐
    A.assetsImagesUiIcon_music_disabled,
    A.assetsImagesUiIcon_music_enabled,
    A.assetsImagesUiIcon_sound_disabled,
    A.assetsImagesUiIcon_sound_enabled,
  ]);
  await Flame.audio.loadAll([
    A.assetsAudioSfxHaha1,
    A.assetsAudioSfxHaha2,
    A.assetsAudioSfxHaha3,
    A.assetsAudioSfxHaha4,
    A.assetsAudioSfxHaha5,
    A.assetsAudioSfxOuch1,
    A.assetsAudioSfxOuch2,
    A.assetsAudioSfxOuch3,
    A.assetsAudioSfxOuch4,
    A.assetsAudioSfxOuch5,
    A.assetsAudioSfxOuch6,
    A.assetsAudioSfxOuch7,
    A.assetsAudioSfxOuch8,
    A.assetsAudioSfxOuch9,
    A.assetsAudioSfxOuch10,
    A.assetsAudioSfxOuch11,
    //背景音乐
    A.assetsAudioBgmHome,
    A.assetsAudioBgmPlaying,
  ]);
  SharedPreferences preferences = await SharedPreferences.getInstance();


  runApp(FlyGame(preferences).widget);
}
