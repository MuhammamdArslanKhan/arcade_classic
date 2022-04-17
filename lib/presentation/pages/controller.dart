import 'dart:math';

class LevelController{

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }
}