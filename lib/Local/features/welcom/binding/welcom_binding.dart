import 'package:get/get.dart';
import 'package:news/Local/features/welcom/controller/welcom_controller.dart';

class WelcomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WelcomController());
  }
}
