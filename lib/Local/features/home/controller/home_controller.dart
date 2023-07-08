import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:news/Local/features/categories/model/news_model.dart';
import '../../../../Global/Core/Class/HiveBox.dart';
import '../../../../Global/Core/Class/status_request.dart';
import '../../../../Global/Core/functions/handiling_data_fun.dart';
import '../../categories/data/categories_news_data.dart';

class HomeController extends GetxController {
  List<Article> hotNews = [];
  List<Article> allNews = [];
  bool isProgreesRefresh = false;
  StatusRequest statusRequest = StatusRequest.none;
  NewsData newsData = NewsData(Get.find());
  Box<Article> favoriteBox = Hive.box(HiveBox.favoriteBox);
  fetchData() async {
    isProgreesRefresh == false
        ? statusRequest = StatusRequest.loading
        : StatusRequest.none;
    update();
    var response = await newsData.getNewsData(query: 'language=en');
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'ok') {
        List json = response['articles'];
        allNews = json.map((e) => Article.fromJson(e)).toList();
        for (int i = 0; i < allNews.length; i++) {
          if (allNews[i].publishedAt!.hour >= DateTime.now().hour - 6) {
            hotNews.add(allNews[i]);
          }
        }
        print(hotNews.length);
        statusRequest = StatusRequest.none;
        update();
      } else {
        statusRequest = StatusRequest.faliure;
        update();
      }
    }
    update();
  }

  refreshData() async {
    isProgreesRefresh = true;
    update();
    await fetchData();
    isProgreesRefresh = false;
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
