import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:game_uno/alerta.dart';
import 'package:game_uno/necesarios.dart';

class Lobo extends SpriteComponent with KeyboardHandler, Tappable {
  late double centerX = -20, centerY = 250;
  final double spriteWidth = 200, spriteHeight = 200;
  int tapIndex = 0;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('lobo.png');
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
        position = Vector2(450, 250);
        BtnValidar.ubicacionLobo(450, 250);
        break;
      case 2:
        position = Vector2(650, 50);
        BtnValidar.ubicacionLobo(650, 50);

        break;
      case 3:
        position = Vector2(450, 250);
        BtnValidar.ubicacionLobo(-20, 250);
        if (BtnValidar.xO == 900) {
          Alerta.actualizarTexto('');
        }
        break;
      case 0:
      default:
        position = Vector2(-20, 250);
    }
    super.onTapDown(info);
    return true;
  }
}
