import 'package:get/get.dart';
import '../Core/Class/crud.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
