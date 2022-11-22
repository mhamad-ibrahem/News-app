import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/News/NewsController.dart';
import '../../Categories/CategoriesScreen.dart';

class AllNewsScreen extends StatelessWidget {
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen(appBarText: 'All News'.tr, category: '');
  }
}
