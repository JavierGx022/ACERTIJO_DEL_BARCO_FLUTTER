import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_uno/alerta.dart';
import 'package:game_uno/components/background.dart';
import 'package:game_uno/components/balsa.dart';
import 'package:game_uno/necesarios.dart';
import 'package:game_uno/components/lechuga.dart';
import 'package:game_uno/components/lobo.dart';
import 'package:game_uno/components/ni%C3%B1o_uno.dart';
import 'package:game_uno/components/oveja.dart';
import 'package:game_uno/main.dart';
import 'package:game_uno/rutas.dart';
import 'package:flame_audio/flame_audio.dart';

class MyGame extends FlameGame
    with KeyboardEvents, HasKeyboardHandlerComponents, HasTappables {
  late AudioPool pool;

//FlameAudio.bgm.load('adventure-track.mp3');

  @override
  Future<void> onLoad() async {
    add(Rio());
    add(Balsa());
    add(BoyUno());
    add(Lobo());
    add(Oveja());
    add(Lechuga());
    //add(BtnValidar());
    add(Alerta());
    startBgmMusic();

    return super.onLoad();
  }

  void startBgmMusic() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('fondo.mp3');
  }
}

class MyGameWidget extends StatelessWidget {
  final MyGame game;
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
            BtnValidar.stop();
            Alerta.actualizarTexto('AYUDA AL NIÑO A CRUZAR CON LOS ANIMALES');
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
