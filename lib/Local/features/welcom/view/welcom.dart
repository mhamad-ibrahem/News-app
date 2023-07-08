import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Global/Core/Constant/Size.dart';
import 'package:news/Local/Core/Constant/Images.dart';
import 'package:news/Local/Core/Constant/Routes.dart';
import 'package:news/Local/View/Widget/CustomButton.dart';
import 'package:news/Local/features/welcom/controller/welcom_controller.dart';
import '../../../../Global/Core/Services/services.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});
  final WelcomController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<WelcomController>(
            builder: (controller) => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          child: Lottie.asset(AppImages.start),
                        ),
                        AnimatedBuilder(
                          animation: controller.animation,
                          builder: (context, child) => AnimatedOpacity(
                            opacity: controller.animation.value,
                            duration: const Duration(milliseconds: 900),
                            child: Text(
                              'Best Experience To See News\nAround The Word',
                              style: Get.textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CustomButton(
                      buttonBody: 'Next'.tr,
                      onTap: () {
                        Services.fingerTipAuth == 'true'
                            ? controller.loginWithFingerTipe()
                            : Get.offAllNamed(AppRoute.main);
                      },
                      buttonWidth: AppSize.screenWidth),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
