
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Main/Categories/CategoriesScreen.dart';

class ScinceScreen extends StatelessWidget {
  const ScinceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesScreen(appBarText: 'Scince News'.tr, category: 'science'.tr);
  }
}
