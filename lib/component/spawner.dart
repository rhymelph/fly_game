import 'package:fly_game/game.dart';

class FlySpawner {
  final FlyGame game;

  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7; //最大存活率

  int currentInterval;
  int nextSpawn;

  FlySpawner(this.game) {
    start(); //三秒生成一个
    game.spawnFly(); // 立即生成
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.flies.forEach((element) {
      element.isDead = true;
    });
  }

  void update(double t) {
    int nowTimesamp = DateTime.now().millisecondsSinceEpoch;

    //如果没有死掉，将存活加一， 目标是不让超过最大存货数量
    int livingFlies = 0;
    game.flies.forEach((element) {
      if (!element.isDead) livingFlies += 1;
    });

    //判断当前时间是否超过下次生成的时间
    if (nowTimesamp >= nextSpawn && livingFlies < maxFliesOnScreen) {
      //生成一个
      game.spawnFly();

      // 当前时间间隔大于最小时间间隔，才对时间进行减少
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimesamp + currentInterval;
    }
  }
}
