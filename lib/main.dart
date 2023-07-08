import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Global/Core/Services/services.dart';
import 'Global/Core/Theme/Themes.dart';
import 'Global/binding/app_bindings.dart';
import 'Local/Core/Constant/Routes.dart';
import 'Local/features/settings/controller/settings_controller.dart';
import 'Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SettingsController controller = Get.put(SettingsController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: controller.saveTheme == false || controller.saveTheme == null
              ? Themes.lightTheme
              : Themes.darkTheme,
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.welcom,
          getPages: routes,
        );
      },
    );
  }
}
