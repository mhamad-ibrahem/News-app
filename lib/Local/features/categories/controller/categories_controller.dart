// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Global/Core/Class/status_request.dart';
import '../../../../Global/Core/functions/handiling_data_fun.dart';
import '../data/categories_news_data.dart';
import '../model/news_model.dart';

class CategoriesController extends GetxController {
  List<Article> articList = [];
  List<Article> searchList = [];
  int page = 1;
  int last = 1000;
  bool isFirstRun = false;
  bool hasNextPage = true;
  bool isLoadMoreRuning = false;
  TextEditingController search = TextEditingController();
  // late ScrollController scrollController;
  late String categoryName;
  StatusRequest statusRequest = StatusRequest.none;
  NewsData newsData = NewsData(Get.find());

  fetchData() async {
    categoryName = Get.arguments['category'];
    print(categoryName);
    String query = 'category=$categoryName&page=$page';
    statusRequest = StatusRequest.loading;
    update();
    var response = await newsData.getNewsData(query: query);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'ok') {
        List json = response['articles'];
        articList = json.map((e) => Article.fromJson(e)).toList();
        statusRequest = StatusRequest.none;
        update();
      } else {
        statusRequest = StatusRequest.faliure;
        update();
      }
    }
    update();
  }

  //fetch data from api
  // Box loaclizationBox = Hive.box(HiveBox.loacalizationBox);
  // Future<List<Article>?> getData(String categories) async {
  //   isFirstRun = true;
  //   update();
  //   String? language = loaclizationBox.get('language');
  //   print('====================================');
  //   print(language);
  //   var response = await http.get(Uri.parse(
  //       'https://newsapi.org/v2/top-headlines?language=$language&category=$categories&page=$page&apiKey=6e696c69c23d471283bcd7ece41b4a67'));
  //   if (response.statusCode == 200) {
  //     try {
  //       var responseBody = jsonDecode(response.body);
  //       NewsModel articles = NewsModel.fromJson(responseBody);
  //       List<Article> articlesList =
  //           articles.articles!.map((e) => Article.fromJson(e)).toList();
  //       return articlesList;
  //     } catch (e) {
  //       print('Error catch  $e');
  //     }
  //   }
  //   return null;
  // }

  // Future<List<Article>?> loadMoreData(String category) async {
  //   scrollController = ScrollController()
  //     ..addListener(() {
  //       if (scrollController.offset ==
  //           scrollController.position.maxScrollExtent) {
  //         print(page);
  //         if (hasNextPage == true) {
  //           isFirstRun = false;
  //           isLoadMoreRuning = true;
  //           page++;
  //           fetchData('sport');
  //           update();
  //         } else {
  //           isLoadMoreRuning = false;
  //           update();
  //         }
  //       }
  //     });

  //   return null;
  // }

  void searshing(String value) {
    //filltering list
    List<Article> list = [];
    if (value.isEmpty) {
      list = articList; //if searshing value is empty return full list
    } else {
      list = articList
          .where(
              (item) => item.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    searchList = list;
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
