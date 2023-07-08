import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/Core/Constant/Routes.dart';
import 'package:news/Local/features/main/controller/main_controller.dart';
import '../../../../Core/Constant/Colors.dart';
import 'drawer_body.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<MainController>(
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            DrawerBody(
              fun: () {
                Get.toNamed(AppRoute.helpCenter);
              },
              icon: Icons.help,
              iconColor: AppColors.blue,
              title: 'Help & Support'.tr,
            ),
            DrawerBody(
              widget: controller.visible == false
                  ? const Icon(
                      Icons.arrow_forward,
                      color: AppColors.cyan,
                    )
                  : const Icon(
                      Icons.arrow_downward,
                      color: AppColors.cyan,
                    ),
              fun: () {
                Get.toNamed(AppRoute.settings);
              },
              icon: Icons.settings,
              iconColor: AppColors.primaryColor,
              title: 'Settings'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
