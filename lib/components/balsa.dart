import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';

class Balsa extends SpriteComponent with KeyboardHandler {
  late double centerX = 400, centerY = 400;
  final double spriteWidth = 400, spriteHeight = 120;

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load('balsa.png');
    size = Vector2(spriteWidth, spriteHeight);

    position = Vector2(centerX, centerY);

    return super.onLoad();
  }
}
