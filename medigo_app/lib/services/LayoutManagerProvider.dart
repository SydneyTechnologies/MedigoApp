import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LayoutManagerProvider extends ChangeNotifier {
  Map<String, double> _widgetHeights = {};

  Map<String, double> get widgetHeights => _widgetHeights;

  double left = 0;
  double right = (200 / 2) - (0.05 * 200);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController insuranceCardController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Page Tabs state
  bool prescriptionActive = true;

  Map activeState = {
    "color": const Color(0xFF157145),
    "showText": true,
    "style": const TextStyle(
      color: Colors.white,
    ),
  };

  double storeChildHeight(GlobalKey widgetKey, String widgetName) {
    double boxSize = 0;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        RenderBox? renderBox =
            widgetKey.currentContext?.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          _widgetHeights[widgetName] = renderBox.size.height;
          boxSize = renderBox.size.height;
          notifyListeners();
        }
      },
    );
    return boxSize;
  }

  switchMenu(menuState state, double value) {
    menuState currentState = state;
    switch (currentState) {
      case menuState.home:
        left = 0;
        right = (value / 2) - (0.05 * value);
        break;
      case menuState.cart:
        left = (value / 2) - (0.05 * value);
        right = 0;
        break;
      default:
        left = 0;
        right = (value / 2) - (0.05 * value);
    }
    notifyListeners();
  }

  void setTabState(bool active) {
    prescriptionActive = active;
    notifyListeners();
  }
}
