import 'package:get/get.dart';
class DrawerControll extends GetxController{
  bool visible = false;
  showMoreInfo(){
    visible = !visible;
    update();
  }
}