import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/Global/Core/Class/HiveBox.dart';
import 'package:news/Local/features/categories/model/news_model.dart';

class FavoriteController extends GetxController {
  Box<Article> hiveBox = Hive.box(HiveBox.favoriteBox);
  List<Article> favoriteList = [];
  @override
  void onInit() {
    getData();
    print(favoriteList.length);
    super.onInit();
  }

  getData() {
    favoriteList.clear();
    for (int i = 0; i < hiveBox.length; i++) {
      if (hiveBox.getAt(i)!.isLiked == true && hiveBox.isNotEmpty) {
        favoriteList.add(hiveBox.getAt(i)!);
      }
    }
    print("length${favoriteList.length}");
    update();
  }

  removeFromFavorite(int index) async {
    favoriteList[index].isLiked = false;
    await hiveBox.deleteAt(index);
    favoriteList.removeAt(index);
    update();
  }

  removeAll() async {
    hiveBox.clear();
    favoriteList.clear();
    update();
  }
}
