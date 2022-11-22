import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/Theme/Themes.dart';
import 'package:post_app/View/Start/StratScreen.dart';

import 'Controller/Local/LocalController.dart';
import 'LocalIzation/Localization.dart';
import 'Services/Services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await   initialServices();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 LocalizationController localController=Get.put(LocalizationController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: localController.saveTheme==false?Themes.lightTheme:Themes.darkTheme,
       locale:localController.language,
       debugShowCheckedModeBanner: false,
      translations: Localization(),
      home:const StartScreen()
    );
  }
}
