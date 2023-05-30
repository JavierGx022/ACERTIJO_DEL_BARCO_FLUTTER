import 'package:flutter/material.dart';
import 'package:game_uno/rutas.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Rutas.rutas,
    ),
  );
}
