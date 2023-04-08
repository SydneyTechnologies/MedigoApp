import 'package:flutter/material.dart';
import 'dart:math';

enum menuState {
  home,
  cart,
}

TextStyle secondaryStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

Color getRandomColor() {
  Random random = new Random();
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);
  return Color.fromRGBO(red, green, blue, 1);
}
