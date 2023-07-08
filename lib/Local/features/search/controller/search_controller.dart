import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/features/search/model/search_country_model.dart';
import '../../../../Global/Core/Class/status_request.dart';
import '../../../../Global/Core/functions/handiling_data_fun.dart';
import '../../categories/data/categories_news_data.dart';
import '../../categories/model/news_model.dart';
import '../data/country_list.dart';

class SearchingController extends GetxController {
  late CountryModel selectedCountry;
  late String selectedSorted;
  List<CountryModel> countries = countriesList;
  List<String> sortedList = ['Newest', 'Oldest'];
  List<Article> news = [];
  List<Article> reversedNews = [];
  TextEditingController search = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  NewsData newsData = NewsData(Get.find());
  @override
  void onInit() {
    selectedCountry = countries[0];
    selectedSorted = sortedList[0];
    filterByCountry();
    super.onInit();
  }

  changeCountry(CountryModel countryModel) {
    selectedCountry = countryModel;
    filterByCountry();
    update();
  }

  changeSorted(String sorted) {
    selectedSorted = sorted;
    sortedBy(selectedSorted);
    update();
  }

  filterByCountry() async {
    print(selectedCountry.countryCode);
    String query = 'country=${selectedCountry.countryCode}';
    statusRequest = StatusRequest.loading;
    update();
    var response = await newsData.getNewsData(query: query);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'ok') {
        List json = response['articles'];
        news = json.map((e) => Article.fromJson(e)).toList();
        reversedNews = news.reversed.toList();
      }
      statusRequest = StatusRequest.none;
      update();
    } else {
      statusRequest = StatusRequest.faliure;
      update();
    }
  }

  sortedBy(String date) async {
    if (date == 'Oldest') {
      reversedNews = news.reversed.toList();
      update();
    } else {
      news;
      update();
    }
  }
}
