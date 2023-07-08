import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/View/Widget/custom_app_bar.dart';
import 'package:news/Local/features/main/view/custom/home_drawer.dart';
import '../../../../Global/Core/Constant/Size.dart';
import '../../../Core/Constant/Colors.dart';
import '../controller/main_controller.dart';

class MainView extends StatelessWidget {
  final MainController controller = Get.find();

  MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
            appBar: customAppBar(
                title: 'News',
                leading: IconButton(
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                    icon: const Icon(Icons.menu))),
            bottomNavigationBar: bottomNavigat(context),
            body: Stack(children: [
              controller.currentScreen,
              AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    double slide = AppSize.screenWidth *
                        controller.animationController.value;
                    return Transform.translate(
                      offset: Offset(-slide, 0),
                      child: child,
                    );
                  },
                  child: Drawer(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50),
                      )),
                      width: AppSize.screenWidth * 0.7,
                      child: Material(
                          elevation: 7,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(
                              50,
                            ),
                          ),
                          child: DrawerScreen())))
            ])),
      ),
    );
  }

  Widget bottomNavigat(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => BottomNavigationBar(
          currentIndex: controller.navigatorValue,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
          onTap: (current) {
            controller.changeSelectedValue(current);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.home),
              ),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.favorite),
              ),
              label: 'Favorite'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(Icons.filter_list_sharp),
              ),
              label: 'Filter'.tr,
            ),
          ]),
    );
  }
}
