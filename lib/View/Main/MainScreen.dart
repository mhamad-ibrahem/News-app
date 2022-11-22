import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constant/Constant.dart';
import '../../Controller/Main/MainController.dart';

class MainScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: controller.currentScreen,
          bottomNavigationBar: BottomNavigat(context),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomNavigat(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => BottomNavigationBar(
          currentIndex: controller.navigatorValue,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: red,
          unselectedItemColor: Theme.of(context).accentColor,
          onTap: (current) {
            controller.changeSelectedValue(current);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.sports),
              ),
              label: 'sport'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.health_and_safety),
              ),
              label: 'health'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.science),
              ),
              label: 'scince'.tr,
            ),
          ]),
    );
  }
}
