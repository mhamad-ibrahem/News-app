import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Model/Articles.dart';
import '../Local/LocalController.dart';

class NewsController extends GetxController {
  static LocalizationController controller = Get.find();
  Future<List<Article>?>? articList; 
  //fetch data from api
  Future<List<Article>?> getData(String categories) async {
    String? country = controller.country;
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&category=$categories&apiKey=d34ddceb6d0a41e095e7b8dad1b3aebb'));
    if (response.statusCode == 200) {
      try {
        var responseBody = jsonDecode(response.body);
        NewsModel articles = NewsModel.fromJson(responseBody);
        List<Article> articlesList =
            articles.articles!.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } catch (e) {
        print('Error catch  $e');
      }
    }
  }
}
