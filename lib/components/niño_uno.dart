import 'package:flame/components.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:game_uno/alerta.dart';
import 'package:game_uno/necesarios.dart';

class BoyUno extends SpriteComponent with KeyboardHandler, Tappable {
  late double centerX = 600, centerY = 120;
  final double spriteWidth = 200, spriteHeight = 340;
  int tapIndex = 0;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('boy.png');
    size = Vector2(spriteWidth, spriteHeight);

    position = Vector2(centerX, centerY);

    return super.onLoad();
  }

  @override
  bool onTapDown(TapDownInfo info) {
    tapIndex++;
    if (tapIndex > 2) {
      tapIndex = 0;
    }

    switch (tapIndex) {
      case 1:
        position = Vector2(800, 30);
        BtnValidar.xN = 800;
        BtnValidar.yN = 30;
        if (BtnValidar.xO == 100 &&
            BtnValidar.xLc == 130 &&
            BtnValidar.xL == 650) {
          Alerta.actualizarTexto('LA OVEJA SE COMIO LA LECHUGA');
          BtnValidar.error();
        } else if (BtnValidar.xO == 100 &&
            BtnValidar.xL == -20 &&
            BtnValidar.xLc == 960) {
          Alerta.actualizarTexto('EL LOBO SE COMIO A LA OVEJA');
          BtnValidar.error();
        } else if (BtnValidar.xO == 900 &&
            BtnValidar.xL == -20 &&
            BtnValidar.xLc == 130) {
          Alerta.actualizarTexto('VAS BIEN');
        } else if (BtnValidar.xO == 900 &&
            BtnValidar.xL == 650 &&
            BtnValidar.xLc == 960) {
          Alerta.actualizarTexto(
              '¡¡¡¡¡ASI NO ES EL JUEGO!!!!!!\n HAS RESUELTO EL ACERTIJO');
          BtnValidar.error();
        }
        break;
      case 2:
        position = Vector2(600, 120);

        if (BtnValidar.xO == 900 &&
            BtnValidar.xL == 650 &&
            BtnValidar.xLc == 130) {
          Alerta.actualizarTexto('EL LOBO SE COMIO A LA OVEJA');
        } else if (BtnValidar.xO == 900 &&
            BtnValidar.xLc == 960 &&
            BtnValidar.xL == -20) {
          Alerta.actualizarTexto('LA OVEJA SE COMIO LA LECHUGA');
        } else if (BtnValidar.xO == 100 &&
            BtnValidar.xL == -20 &&
            BtnValidar.xLc == 960) {
          Alerta.actualizarTexto('EL LOBO SE COMIO A LA OVEJA');
        }
        break;
      case 0:
      default:
        position = Vector2(600, 120);
    }
    super.onTapDown(info);
    return true;
  }
}
