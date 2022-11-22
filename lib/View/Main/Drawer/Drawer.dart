import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Main/Drawer/All%20News/AllNews.dart';
import 'package:post_app/View/Main/Drawer/Options/OPtionScreen.dart';
import 'package:post_app/View/Main/Drawer/Support/SupportScreen.dart';
import 'package:post_app/View/Main/Drawer/drawerTile.dart';

import '../../../Constant/Constant.dart';
import '../../../Controller/Drawer/DrawerController.dart';


class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final DrawerControll controller = Get.put(DrawerControll(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<DrawerControll>(
          builder: (controller) => Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              DrawerTile(
                fun: () {
                  Get.to(() => AllNewsScreen(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 700));
                },
                leading: const Icon(
                  Icons.new_releases,
                  color: green,
                ),
                title: 'See all news'.tr,
              ),
              DrawerTile(
                fun: () {
                  Get.to(() =>  SupoortScreen(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 700));
                },
                leading: const Icon(
                  Icons.help,
                  color: blue,
                ),
                title: 'Help & Support'.tr,
              ),
              DrawerTile(
                widget: controller.visible == false
                    ? const Icon(
                        Icons.arrow_forward,
                        color: cyan,
                      )
                    : const Icon(
                        Icons.arrow_downward,
                        color: cyan,
                      ),
                fun: () {
                  controller.showMoreInfo();
                },
                leading: Icon(
                  Icons.settings,
                  color: red,
                ),
                title: 'Settings'.tr,
              ),
              Visibility(visible: controller.visible, child: OptionScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
