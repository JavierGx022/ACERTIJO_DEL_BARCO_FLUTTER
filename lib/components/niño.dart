import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';

class Boy extends SpriteAnimationComponent with KeyboardHandler, Tappable {
  late double screenWidth, screenHeight, centerX, centerY;
  final double spriteWidth = 150, spriteHeight = 150;
  final double spritetSheetW = 614, spritetSheetH = 564;
  int animationIndex = 0;
  late SpriteAnimation boyQuieto, boyCamina;

  @override
  Future<void>? onLoad() async {
    //sprite = await Sprite.load('campe.png');

    final spriteImage = await Flame.images.load('campe_sheet.png');
    final spriteSheet = SpriteSheet(
        image: spriteImage, srcSize: Vector2(spritetSheetW, spritetSheetH));

    //sprite = spriteSheet.getSprite(0, 0);
    boyQuieto = spriteSheet.createAnimationByLimit(
        xInit: 0, yInit: 0, step: 1, sizeX: 2, stepTime: .3);
    boyCamina = spriteSheet.createAnimationByLimit(
        xInit: 0, yInit: 0, step: 9, sizeX: 2, stepTime: .3);

    animation = boyQuieto;

    size = Vector2(spritetSheetW, spritetSheetH);

    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;
    centerX = (screenWidth / 2) - (spritetSheetW / 2);
    centerY = (screenHeight / 2) - (spritetSheetH / 2);

    position = Vector2(centerX, centerY);

    return super.onLoad();
  }

  @override
  bool onTapDown(TapDownInfo info) {
    animationIndex++;
    animation = boyCamina;
    super.onTapDown(info);
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print(info);
    return true;
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
        keysPressed.contains(LogicalKeyboardKey.keyW)) {
      print('ARRIBA BOY');
      position = Vector2(centerX, centerY--);
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown) ||
        keysPressed.contains(LogicalKeyboardKey.keyS)) {
      print('ABAJO BOY');
      position = Vector2(centerX, centerY++);
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(LogicalKeyboardKey.keyD)) {
      print('DERECHA BOY');
      position = Vector2(centerX++, centerY);
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
        keysPressed.contains(LogicalKeyboardKey.keyA)) {
      print('IZQUIERDA BOY');
      position = Vector2(centerX--, centerY);
    }
    return true;
  }
}

extension CreateAnimationByLimit on SpriteSheet {
  SpriteAnimation createAnimationByLimit({
    required int xInit,
    required int yInit,
    required int step,
    required int sizeX,
    required double stepTime,
    bool loop = true,
  }) {
    final List<Sprite> spriteList = [];
    int x = xInit;
    int y = yInit - 1;

    for (var i = 0; i < step; i++) {
      if (y >= sizeX) {
        y = 0;
        x++;
      } else {
        y++;
      }

      spriteList.add(getSprite(x, y));
      print(x.toString() + ' ' + y.toString());
    }

    return SpriteAnimation.spriteList(spriteList,
        stepTime: stepTime, loop: loop);
  }
}
