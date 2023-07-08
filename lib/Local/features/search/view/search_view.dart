import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Global/Core/Class/status_request.dart';
import 'package:news/Global/Core/Constant/Size.dart';
import 'package:news/Local/View/Shared/loading_widget.dart';
import 'package:news/Local/View/Widget/retry_button.dart';
import 'package:news/Local/features/search/controller/search_controller.dart';
import 'package:news/Local/features/search/view/custom/search_filter.dart';

import '../../../Core/Constant/Routes.dart';
import '../../categories/view/custom/categories_card.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final SearchingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: GetBuilder<SearchingController>(
            builder: (controller) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: SearchFilter(
                          filterBy: 'Country',
                          onChanged: (val) {
                            controller.changeCountry(val);
                          },
                          selectedValue: controller.selectedCountry,
                          list: controller.countries,
                          isCountries: true,
                        )),
                    Expanded(
                        flex: 1,
                        child: SearchFilter(
                          filterBy: 'Sorted By',
                          onChanged: (val) {
                            controller.changeSorted(val);
                          },
                          selectedValue: controller.selectedSorted,
                          isCountries: false,
                          sortList: controller.sortedList,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.statusRequest == StatusRequest.loading
                    ? const LoadingWidget()
                    : controller.statusRequest == StatusRequest.serverFaliure
                        ? RetryButton(
                            textError: 'Some thing wrong',
                            hight: AppSize.screenHight * 0.2,
                            retryFunction: () {
                              controller.filterByCountry();
                            })
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.selectedSorted == 'Newest'
                                ? controller.news.length
                                : controller.reversedNews.length,
                            itemBuilder: (context, index) => CategoriesCard(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoute.newsDetails,
                                    arguments: {
                                      'NewsModel':
                                          controller.selectedSorted == 'Newest'
                                              ? controller.news[index]
                                              : controller.reversedNews[index],
                                    },
                                  );
                                },
                                article: controller.selectedSorted == 'Newest'
                                    ? controller.news[index]
                                    : controller.reversedNews[index]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
