import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/View/Widget/custom_app_bar.dart';
import '../../../Core/Constant/Colors.dart';
import '../controller/settings_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  final SettingsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Settings'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<SettingsController>(
                    builder: (controller) => Column(
                      children: [
                        //Switch to dark mode
                        SwitchListTile(
                          value: controller.switchTheme!,
                          onChanged: (val) {
                            controller.changeTheme(val);
                          },
                          activeColor: AppColors.primaryColor,
                          title: Text(
                            'Dark Mode'.tr,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        SwitchListTile(
                          value: controller.saveFingetValue!,
                          onChanged: (val) {
                            controller.enableFingerTip(val);
                          },
                          activeColor: AppColors.primaryColor,
                          title: Text(
                            'Finger Tipe Authintication'.tr,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
