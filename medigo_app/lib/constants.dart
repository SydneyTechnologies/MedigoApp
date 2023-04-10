// ignore_for_file: constant_identifier_names

import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:math';

enum menuState {
  home,
  cart,
}

const TextStyle secondaryStyle = TextStyle(
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

// here we are going to create a class for the applications API
class MedigoAPI {
  // this class will help us link all the endpoints to be used in our application
  // for now let use integrate the authentication endpoints
  static const String BASE_URL = "https://medigoapi-production.up.railway.app/";
  static const String DOCS = "$BASE_URL\\docs";

  // authentication routes
  static const String login = "${BASE_URL}login";
  static const String register = "${BASE_URL}register";
  static const String getUser = "${BASE_URL}me";
}
