
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Constant/Constant.dart';
import '../Main/MainScreen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset(
                    'images/29447-global-mobile-news-network.json'),
              ),
              Text(
                'See'.tr,
                style: Get.textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              MaterialButton(
                onPressed: () {
                  Get.offAll(() => MainScreen(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 800));
                },
                color: red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                height: 20,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 100, right: 100),
                child: Text(
                  'Next'.tr,
                  style: TextStyle(color: white, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
