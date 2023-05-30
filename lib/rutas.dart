import 'package:flame/game.dart' hide Route;
import 'package:flutter/material.dart';
import 'package:game_uno/menu.dart';
import 'package:game_uno/mygame.dart';

class Rutas {
  static const menu = '/';
  static const juego1 = '/juego1';

  static Route rutas(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case menu:
        return _buildRoute(const Menu());
      case juego1:
        return _buildRoute(MyGameWidget(game: MyGame()));
      default:
        throw Exception('La ruta no existe');
    }
  }
}
