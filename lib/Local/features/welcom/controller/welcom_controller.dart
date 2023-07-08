import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:news/Global/Core/Services/services.dart';
import '../../../../Global/Core/Class/app_tost.dart';
import '../../../Core/Constant/Routes.dart';

class WelcomController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final auth = LocalAuthentication();
  late AnimationController animationController;
  late Animation<double> animation;

  Future<bool> hasBiomatric() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    print(canCheckBiometrics);
    return canCheckBiometrics;
  }

  Future<bool> authnticate() async {
    final isAvailable = await hasBiomatric();
    var result = isAvailable ? true : false;
    if (result == true) {
      try {
        var available = await auth.authenticate(
          localizedReason: 'Put Your Finger To Authnticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
        if (available) AppToasts.successToast('Scuccess Login');
        return available;
      } on PlatformException catch (e) {
        print(e);
        AppToasts.errorToast("$e");
        return false;
      }
    } else {
      AppToasts.errorToast('This future are not available for you device');
      return false;
    }
  }

  loginWithFingerTipe() async {
    final authintecated = await authnticate();
    if (authintecated == true) {
      Get.offAllNamed(AppRoute.main);
    } else {
      print('error');
    }
  }

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    print('fingerTip ${Services.fingerTipAuth}');
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
