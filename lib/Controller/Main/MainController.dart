

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View/Main/Categories/HealthScreen.dart';
import '../../View/Main/Categories/ScinceScreen.dart';
import '../../View/Main/Categories/SportScreen.dart';

class MainController extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _currentScreen = SportScreen();
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    update();
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = SportScreen();

          break;
        }
      case 1:
        {
          _currentScreen =  HealthScreen();
          break;
        }
      case 2:
        {
          _currentScreen =ScinceScreen();
          break;
        }
      
    }
  }
}
