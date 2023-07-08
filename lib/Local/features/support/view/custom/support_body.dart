import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportBody extends StatelessWidget {
  const SupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1.5,
          color: Get.theme.primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'You need internet to see news '.tr,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1.5,
          color: Get.theme.primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'You can see all type of news from drawer then all news '.tr,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1.5,
          color: Get.theme.primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'You can see the type of news you want from bottom bar '.tr,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1.5,
          color: Get.theme.primaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'You can change theme or language from drawer then settings '.tr,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1.5,
          color: Get.theme.primaryColor,
        ),
      ],
    );
  }
}
