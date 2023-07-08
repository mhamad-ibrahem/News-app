import 'package:get/get.dart';
import 'package:news/Local/features/categories/controller/categories_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
  }
}
