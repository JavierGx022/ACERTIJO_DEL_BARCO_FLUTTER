import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class BtnValidar extends SpriteComponent with KeyboardHandler, Tappable {
  late double centerX = 800, centerY = 400;
  final double spriteWidth = 300, spriteHeight = 150;
  int tapIndex = 0;

  late CustomTextComponent customTextComponent;

  static double xO = 100,
      yO = 0,
      xN = 600,
      yN = 0,
      xL = -20,
      yL = 0,
      xLc = 130,
      yLc = 0;

  static void ubicacionOveja(double x, double y) {
    xO = x;
    yO = y;
  }

  static void ubicacionLechuga(double x, double y) {
    xLc = x;
    yLc = y;
  }

  static void ubicacionLobo(double x, double y) {
    xL = x;
    yL = y;
  }

  static void error() {
    FlameAudio.play('error.mp3');
  }

  static void stop() {
    FlameAudio.bgm.stop();
  }

  static void win() {
    FlameAudio.play('win.mp3');
  }
}

class CustomTextComponent extends TextComponent {
  CustomTextComponent(String text)
      : super(
          text: text,
        );

  @override
  void onMount() {
    super.onMount();
    position =
        Vector2(50, 50); // Cambia la posición del texto según sea necesario
  }
}
