import 'package:get/get.dart';
import 'package:news/Local/features/favorite/controller/favorite_controller.dart';
import 'package:news/Local/features/main/controller/main_controller.dart';
import '../../home/controller/home_controller.dart';
import '../../search/controller/search_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(SearchingController());
  }
}
