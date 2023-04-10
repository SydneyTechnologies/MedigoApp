// here we create an authentication provider class to manage the login and user data within the application
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medigo_app/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? currentUser;

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }
}
