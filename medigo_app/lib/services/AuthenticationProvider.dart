// here we create an authentication provider class to manage the login and user data within the application
import 'package:flutter/material.dart';
import 'package:medigo_app/models/prescription.dart';
import 'package:provider/provider.dart';
import 'package:medigo_app/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? currentUser;
  UserToken? userToken;
  var authHeader;

  Prescription? userPrescription;

  void setUserCredentials(User user, UserToken tokens, header) {
    currentUser = user;
    userToken = tokens;
    authHeader = header;
    print(currentUser?.email);
    notifyListeners();
  }

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void setUserPresccription(Prescription prescription) {
    userPrescription = prescription;
    print(
        "Length of prescriptions ${userPrescription?.prescriptionList.length}");
    notifyListeners();
  }
}
