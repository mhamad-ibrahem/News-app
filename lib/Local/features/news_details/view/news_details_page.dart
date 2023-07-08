import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news/Local/features/news_details/controller/news_details_controller.dart';
import 'custom/news_details_image.dart';
import 'custom/news_details_text_body.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key});
  final NewsDetailsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsDetailsImage(),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                NewsDetailsTextBody(
                  model: controller.model,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
