import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:game_uno/necesarios.dart';

class Lechuga extends SpriteComponent with KeyboardHandler, Tappable {
  late double centerX = 130, centerY = 260;
  final double spriteWidth = 120, spriteHeight = 120;
  int tapIndex = 0;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('lechuga.png');
    size = Vector2(spriteWidth, spriteHeight);

    position = Vector2(centerX, centerY);

    return super.onLoad();
  }

  @override
  bool onTapDown(TapDownInfo info) {
    tapIndex++;
    if (tapIndex > 3) {
      tapIndex = 0;
    }

    switch (tapIndex) {
      case 1:
        position = Vector2(500, 300);
        BtnValidar.ubicacionLechuga(500, 300);

        break;
      case 2:
        position = Vector2(960, 250);
        BtnValidar.ubicacionLechuga(960, 250);

        break;
      case 3:
        position = Vector2(500, 300);
        BtnValidar.ubicacionLechuga(130, 260);
        break;
      case 0:
      default:
        position = Vector2(130, 260);
    }
    super.onTapDown(info);
    return true;
  }
}
