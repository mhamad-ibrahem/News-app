import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/View/Shared/search_form.dart';
import 'package:news/Local/View/Widget/custom_app_bar.dart';
import 'package:news/Local/features/categories/view/custom/categories_card.dart';
import '../../../../../Global/Core/Class/handiling_data_view.dart';
import '../../../../Core/Constant/Routes.dart';
import '../../controller/categories_controller.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final CategoriesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: controller.categoryName),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CategoriesController>(
          builder: (controller) => HandilingDataView(
              retryFunction: () {
                controller.fetchData();
              },
              statusRequest: controller.statusRequest,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchForm(
                      search: controller.search,
                      onSubmitted: (val) {
                        controller.searshing(val);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.search.text.isEmpty
                            ? controller.articList.length
                            : controller.searchList.length,
                        itemBuilder: (context, index) => CategoriesCard(
                            onTap: () {
                              Get.toNamed(
                                AppRoute.newsDetails,
                                arguments: {
                                  'NewsModel': controller.search.text.isEmpty
                                      ? controller.articList[index]
                                      : controller.searchList[index],
                                },
                              );
                            },
                            article: controller.search.text.isEmpty
                                ? controller.articList[index]
                                : controller.searchList[index]))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
