
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news/Global/Core/Class/HiveKeys.dart';
import '../../../../Global/Core/Class/HiveBox.dart';
import '../../../../Global/Core/Theme/Themes.dart';

class SettingsController extends GetxController {
  bool? switchTheme;
  bool? saveTheme;
  Box themeBox = Hive.box(HiveBox.themeBox);
  Box authBox = Hive.box(HiveBox.authBox);
  bool? saveFingetValue;
  var qrCode = '';
  @override
  void onInit() {
    saveTheme = themeBox.get('dark') ?? false;
    saveFingetValue = authBox.get(HiveKeys.fingerTipe) ?? false;
    switchTheme = saveTheme!;
    super.onInit();
  }

  changeTheme(bool val2) {
    switchTheme = val2;
    if (switchTheme == false) {
      Get.changeTheme(Themes.lightTheme);
    }

    if (switchTheme == true) {
      Get.changeTheme(Themes.darkTheme);
    }
    themeBox.put('dark', switchTheme!);
    Get.forceAppUpdate();
  }

  enableFingerTip(bool value) {
    saveFingetValue = value;
    authBox.put(HiveKeys.fingerTipe, saveFingetValue);
    update();
  }
}
