import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  String _currentRoute = "home"; // current route default set to home
  // Define route names as constants
  late String _previousRoute;

  String get currentRoute => _currentRoute;
  String get previousRoute => _previousRoute;

  void navigateTo(String route) {
    // Method to change route
    _previousRoute = _currentRoute;
    _currentRoute = route;

    notifyListeners();
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
    notifyListeners();
  }
}
