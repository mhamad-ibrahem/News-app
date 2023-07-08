import 'package:get/get.dart';

class SupoortController extends GetxController {
  bool visible = false;
  bool visibleName = false;
  showMoreInfo() {
    visible = !visible;
    update();
  }

  showNameInfo() {
    visibleName = !visibleName;
    update();
  }
}
