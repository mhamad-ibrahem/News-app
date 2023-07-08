import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Global/Core/Class/handiling_data_view.dart';
import 'package:news/Local/View/Widget/CustomBackButton.dart';
import 'package:news/Local/features/categories/view/custom/categories_card.dart';
import '../../../../Core/Constant/Routes.dart';
import '../../../../View/Widget/custom_app_bar.dart';
import '../../../main/view/custom/home_drawer.dart';
import '../../controller/categories_controller.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key, required this.appBarText, required this.category});
  final CategoriesController controller = Get.put(CategoriesController());
  final String appBarText;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        appBar:
            customAppBar(title: appBarText, leading: const CustomBackButton()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<CategoriesController>(
            builder: (controller) => HandilingDataView(
              retryFunction: () {
                controller.fetchData();
              },
              statusRequest: controller.statusRequest,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ...controller.articList.map((e) => CategoriesCard(
                      onTap: () {
                        Get.toNamed(
                          AppRoute.newsDetails,
                          arguments: {
                            'NewsModel': e,
                          },
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

/*Center(
                                child: Text(
                              'No news to show now'.tr,
                              style: Get.textTheme.headline6,
                            ));
                             CategoriesCard(
                                    article: snapshoot.data![index],
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoute.newsDetails,
                                        arguments: {
                                          'NewsModel': snapshoot.data![index]
                                        },
                                      );
                                    },
                                  )),
                             */