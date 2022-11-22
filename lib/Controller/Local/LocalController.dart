import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Services/Services.dart';
import '../../Theme/Themes.dart';

class LocalizationController extends GetxController {
  Locale? language;
  Services services = Get.find();
  bool? switchTheme;
  bool? saveTheme;
  String? country ;

  changeLanguage(String codeLanguage) {
    Locale locale = Locale(codeLanguage);
    services.sharedPreferences.setString('language', codeLanguage);
    update();
    Get.updateLocale(locale);
  }

  changeTheme(bool val2) {
    switchTheme = val2;
    if (switchTheme == false) {
      Get.changeTheme(Themes.lightTheme);
    }

    if (switchTheme == true) {
      Get.changeTheme(Themes.darkTheme);
    }
    services.sharedPreferences.setBool('dark', switchTheme!);
    Get.forceAppUpdate();
  }

  @override
  void onInit() {
    String? sharedprefLanguage =
        services.sharedPreferences.getString('language');
    if (sharedprefLanguage == 'ar') {
      language = const Locale('ar');
      country = 'eg';
    } else if (sharedprefLanguage == 'en') {
      language = const Locale('en');
      country = 'us';
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (Get.deviceLocale!.languageCode == 'en') {
        country = 'us';
      }
      else {
        country = 'eg';
      }
    }
    // country = sharedprefLanguage == 'ar' ? country = 'eg' : country = 'us';
    saveTheme = services.sharedPreferences.getBool('dark') ?? false;
    switchTheme = saveTheme!;
    super.onInit();
  }
}
