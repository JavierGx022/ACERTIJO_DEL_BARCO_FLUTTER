import 'dart:async';
import 'dart:html';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:game_uno/main.dart';
import 'package:game_uno/rutas.dart';

final ScreenSize = Vector2(1280, 720);

class MyGames extends Forge2DGame with KeyboardEvents {
  MyGames() : super(zoom: 100, gravity: Vector2(0, 15));

  final totalbodies = TextComponent(position: Vector2(5, 690))
    ..positionType = PositionType.viewport;
  final fps = FpsTextComponent(position: Vector2(5, 665));

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(ScreenSize);

    add(_Background(size: ScreenSize)..positionType = PositionType.viewport);
    add(fps);
    add(totalbodies);

    @override
    void update(double dt) {
      super.update(dt);
      totalbodies.text = 'Cuerpos: ${world.bodies.length}';
    }
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set keysPressed) {
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.escape)) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Rutas.menu, (r) => false);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Color backgroundColor() {
    return Color.fromARGB(255, 253, 0, 0);
  }
}

class _Background extends PositionComponent {
  _Background({super.size});
  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.x, size.y), BasicPalette.black.paint());
  }
}

class MyGameWidget extends StatelessWidget {
  final MyGames game;
  const MyGameWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState
                ?.pushNamedAndRemoveUntil(Rutas.menu, (r) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GameWidget(
        game: game,
      ),
    );
  }
}
