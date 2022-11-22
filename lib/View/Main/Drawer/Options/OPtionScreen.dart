import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Constant/Constant.dart';
import '../../../../Controller/Local/LocalController.dart';

class OptionScreen extends StatelessWidget {
  OptionScreen({super.key});
  LocalizationController localController =
      Get.put(LocalizationController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (controller) => Column(
        children: [
          //arabic alnguage button

          ListTile(
            title: Text('Arabic Langauge'.tr,
                style: Theme.of(context).textTheme.headline5),
            trailing: const Icon(
              Icons.language_rounded,
              color: blue,
              size: 25,
            ),
            onTap: () {
              controller.changeLanguage('ar');
              controller.country = 'eg';
              Get.forceAppUpdate();
              print(controller.country);
            },
          ),
          const Divider(
            thickness: 1.5,
          ),

          //emglish language button

          ListTile(
            title: Text(
              'English Langauge'.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
            onTap: () {
              controller.changeLanguage('en');
              controller.country = 'us';
              Get.forceAppUpdate();
            },
            trailing: const Icon(
              Icons.language_rounded,
              color: green,
              size: 25,
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),

          //Switch to dark mode

          SwitchListTile(
            value: controller.switchTheme!,
            onChanged: (val) {
              controller.changeTheme(val);
            },
            activeColor: red,
            title: Text(
              'Dark Mode'.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
