import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/features/home/controller/home_controller.dart';
import '../../../../../Global/Core/Class/handiling_data_view.dart';
import '../../../../Core/Constant/Routes.dart';
import '../../../../View/Widget/custom_app_bar.dart';
import '../custom/categories_card.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(title: 'All News'),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<HomeController>(
            builder: (controller) => HandilingDataView(
              retryFunction: () {
                controller.fetchData();
              },
              statusRequest: controller.statusRequest,
              child: ListView(
                children: [
                  ...controller.allNews.map((e) => CategoriesCard(
                      onTap: () {
                        Get.toNamed(
                          AppRoute.newsDetails,
                          arguments: {'NewsModel': e},
                        );
                      },
                      article: e)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
