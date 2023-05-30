import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';

class Rio extends SpriteComponent with KeyboardHandler {
  late double screenWidth, screenHeight, centerX, centerY;

  @override
  Future<void>? onLoad() async {
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;

    sprite = await Sprite.load('rio.png');
    position = Vector2(0, 0);

    size = Vector2(screenWidth, screenHeight);

    return super.onLoad();
  }
}
