import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/Global/Core/Class/HiveKeys.dart';
import 'package:news/Local/features/categories/model/news_model.dart';
import '../Class/HiveBox.dart';

class Services extends GetxService {
  //i use it for intialize all data i need insted of intialize it in the main funcation
  static String fingerTipAuth = '';
  static dynamic directory;
  late Box box;
  late Box<Article> favbox;
  Future<Services> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleAdapter());
    box = await Hive.openBox(HiveBox.themeBox);
    box = await Hive.openBox(HiveBox.authBox);
    favbox = await Hive.openBox(HiveBox.favoriteBox);
    final atuhBox = Hive.box(HiveBox.authBox);

    if (atuhBox.isEmpty) {
      fingerTipAuth = 'false';
    }
    if (atuhBox.get(HiveKeys.fingerTipe) == false) {
      fingerTipAuth = 'false';
    }
    if (atuhBox.get(HiveKeys.fingerTipe) == true) {
      fingerTipAuth = 'true';
    }
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
