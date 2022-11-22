

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Main/Categories/CategoriesScreen.dart';

class SportScreen extends StatelessWidget {

  const SportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen(appBarText: 'Sport News'.tr, category: 'sports'.tr);
  }
}
