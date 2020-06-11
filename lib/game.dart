import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_game/component/Background.dart';
import 'package:fly_game/component/agile_fly.dart';
import 'package:fly_game/component/credits_button.dart';
import 'package:fly_game/component/drooler_fly.dart';
import 'package:fly_game/component/fly.dart';
import 'package:fly_game/component/help_button.dart';
import 'package:fly_game/component/highscore_display.dart';
import 'package:fly_game/component/hungry_fly.dart';
import 'package:fly_game/component/macho_fly.dart';
import 'package:fly_game/component/music_button.dart';
import 'package:fly_game/component/score_display.dart';
import 'package:fly_game/component/sound_button.dart';
import 'package:fly_game/component/spawner.dart';
import 'package:fly_game/component/start_button.dart';
import 'package:fly_game/view.dart';
import 'package:fly_game/views/credits_view.dart';
import 'package:fly_game/views/home_view.dart';
import 'package:fly_game/views/lost_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/house_fly.dart';
import 'generated/a.dart';
import 'views/help_view.dart';

class FlyGame extends Game with TapDetector {
  //屏幕大小
  Size screenSize;

  //小苍蝇大小
  double tileSize;

  //小苍蝇
  List<Fly> flies = [];
  FlySpawner flySpawner;

  //生成随机数
  Random rad = Random();

  //背景
  Background background;

  //界面
  View activeView = View.home;

  HomeView homeView;
  LostView lostView;
  HelpView helpView;
  CreditsView creditsView;

  //按钮
  StartButton startButton;
  HelpButton helpButton;
  CreditsButton creditsButton;
  MusicButton musicButton;
  SoundButton soundButton;

  //分数
  int score;
  ScoreDisplay scoreDisplay;
  HighscoreDisplay highscoreDisplay;

  //存储最高分
  final SharedPreferences preferences;

  //背景音乐
  AudioPlayer homeBGM;
  AudioPlayer playingBGM;

  FlyGame(this.preferences) {
    initialize();
  }

  void initialize() async {
    //等待屏幕size
    resize(await Flame.util.initialDimensions());

    flySpawner = FlySpawner(this);

    homeView = HomeView(this);
    lostView = LostView(this);
    helpView = HelpView(this);
    creditsView = CreditsView(this);

    background = Background(this);
    startButton = StartButton(this);
    helpButton = HelpButton(this);
    creditsButton = CreditsButton(this);
    musicButton = MusicButton(this);
    soundButton= SoundButton(this);

    scoreDisplay = ScoreDisplay(this);
    highscoreDisplay = HighscoreDisplay(this);
//    spawnFly();

    homeBGM =
        await Flame.audio.loopLongAudio(A.assetsAudioBgmHome, volume: .35);
    playingBGM =
        await Flame.audio.loopLongAudio(A.assetsAudioBgmPlaying, volume: .35);

    playHomeBGM();
  }

  void playHomeBGM() {
    playingBGM.seek(Duration.zero);
    playingBGM.pause();
    homeBGM.resume();
  }

  void playPlayingBGM() {
    homeBGM.seek(Duration.zero);
    homeBGM.pause();
    playingBGM.resume();
  }

  @override
  void render(Canvas canvas) {
    drawBackground(canvas);

    flies.forEach((element) {
      element.render(canvas);
    });

    if (activeView == View.home) homeView.render(canvas);

    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
      helpButton.render(canvas);
      creditsButton.render(canvas);
    }

    if (activeView == View.lost) lostView.render(canvas);

    if (activeView == View.help) helpView.render(canvas);

    if (activeView == View.credits) creditsView.render(canvas);

    if (activeView == View.playing) scoreDisplay.render(canvas);

    highscoreDisplay.render(canvas);

    musicButton.render(canvas);
    soundButton.render(canvas);
  }

  void drawBackground(Canvas canvas) {
    background.render(canvas);
//    Rect bgRect = Rect.fromLTRB(0, 0, screenSize.width, screenSize.height);
//    Paint mPaint = Paint()..color = Color(0xff576574);
//
//    canvas.drawRect(bgRect, mPaint);
  }

  @override
  void update(double t) {
    flies.forEach((element) {
      element.update(t);
    });
    flies.removeWhere((element) => element.isOffScreen);

    flySpawner.update(t);

    if (activeView == View.playing) scoreDisplay.update(t);
  }

  //获取到当前屏幕尺寸
  @override
  void resize(Size size) {
    this.screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void spawnFly() {
    double x = rad.nextDouble() * (screenSize.width - tileSize * 2.025);
    double y = rad.nextDouble() * (screenSize.height - tileSize * 2.025);
//    flies.add(Fly(this,x,y));
    flies.add(randomFly(this, x, y));
  }

  Fly randomFly(FlyGame game, double x, double y) {
    switch (rad.nextInt(5)) {
      case 0:
        return HouseFly(game, x, y);
      case 1:
        return DroolerFly(game, x, y);
      case 2:
        return AgileFly(game, x, y);
      case 3:
        return MachoFly(game, x, y);
      case 4:
        return HungryFly(game, x, y);
    }
    return HouseFly(game, x, y);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandle = false;

    if (!isHandle && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandle = true;
      }
    }

    if (!isHandle && helpButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandle = true;
      }
    }

    if (!isHandle && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditsButton.onTapDown();
        isHandle = true;
      }
    }

    if (!isHandle && musicButton.rect.contains(d.globalPosition)) {
      musicButton.onTapDown();
      isHandle = true;
    }
    if (!isHandle && soundButton.rect.contains(d.globalPosition)) {
      soundButton.onTapDown();
      isHandle = true;
    }
    if (!isHandle) {
      bool didHitAFly = false;
      flies.forEach((element) {
        if (element.flyRect.contains(d.globalPosition)) {
          element.onTapDown();
          isHandle = true;
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        if(soundButton.isEnable){
          Flame.audio.play('sfx/haha${rad.nextInt(5) + 1}.ogg');
        }
        activeView = View.lost;
        playHomeBGM();
      }
    }

    if (!isHandle) {
      if (activeView == View.help || activeView == View.credits) {
        activeView = View.home;
        isHandle = true;
      }
    }
  }
}
