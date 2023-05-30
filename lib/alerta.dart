import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Alerta extends PositionComponent {
  static String _displayText = "AYUDA AL NIÑO A CRUZAR CON LOS ANIMALES";

  @override
  void render(Canvas canvas) {
    TextSpan span = new TextSpan(
      style: new TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
      text: _displayText,
    );

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    this.x = 250;
    this.y = 30;

    // Posiciona el texto en el centro del componente
    Offset position = Offset(
      this.x + this.width / 2 - tp.width / 2,
      this.y + this.height / 2 - tp.height / 2,
    );

    tp.paint(canvas, position);

    super.render(canvas);
  }

  static void actualizarTexto(String nuevoTexto) {
    _displayText = nuevoTexto;
  }
}
