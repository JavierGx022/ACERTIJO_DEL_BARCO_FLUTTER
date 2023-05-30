import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:game_uno/alerta.dart';
import 'package:game_uno/necesarios.dart';

class Oveja extends SpriteComponent with KeyboardHandler, Tappable {
  late double centerX = 100, centerY = 150;
  final double spriteWidth = 120, spriteHeight = 120;

  int tapIndex = 0;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('oveja.png');
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
        BtnValidar.ubicacionOveja(500, 300);
        break;
      case 2:
        position = Vector2(900, 130);
        BtnValidar.ubicacionOveja(900, 150);
        if (BtnValidar.xL == 650 && BtnValidar.xLc == 960) {
          Alerta.actualizarTexto(
              '¡¡¡¡¡¡¡FELICITACIONES!!!!!\n HAS RESUELTO EL ACERTIJO');
          BtnValidar.win();
        }

        break;
      case 3:
        position = Vector2(500, 300);
        BtnValidar.ubicacionOveja(100, 150);
        Alerta.actualizarTexto('');

        break;
      case 0:
      default:
        position = Vector2(100, 150);
    }

    super.onTapDown(info);
    return true;
  }
}
