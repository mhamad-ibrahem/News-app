import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/features/favorite/controller/favorite_controller.dart';
import 'package:news/Local/features/favorite/view/favorite.dart';
import 'package:news/Local/features/home/view/home_view.dart';
import 'package:news/Local/features/search/view/search_view.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int navigatorValue = 0;

  Widget currentScreen = HomeView();
  bool visible = false;
  FavoriteController controller = Get.find();
  late AnimationController animationController;
  bool isDrawerOpen = false;
  showMoreInfo() {
    visible = !visible;
    update();
  }

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    isDrawerOpen
        ? animationController.reverse()
        : animationController.forward();
    print(isDrawerOpen);
    update();
  }

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0.0,
    );
    animationController.forward();
    super.onInit();
  }

  void changeSelectedValue(int selectedValue) {
    navigatorValue = selectedValue;
    update();
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();

          break;
        }
      case 1:
        {
          currentScreen = FavoriteView();
          break;
        }
      case 2:
        {
          currentScreen = SearchView();
          break;
        }
    }
    if (selectedValue == 1) {
      controller.getData();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
