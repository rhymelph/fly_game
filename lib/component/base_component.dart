import 'dart:ui';

import 'package:fly_game/game.dart';

abstract class BaseComponent {
  final FlyGame game;

  BaseComponent(this.game);

  void render(Canvas canvas);

  void update(double dt);
}
