import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  String _currentRoute = "home"; // current route default set to home

  String get currentRoute => _currentRoute;

  void navigateTo(String route) {
    // Method to change route
    _currentRoute = route;
    notifyListeners();
  }
}
