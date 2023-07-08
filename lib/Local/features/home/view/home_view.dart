import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/Global/Core/Class/handiling_data_view.dart';
import 'package:news/Local/Core/Constant/Colors.dart';
import 'package:news/Local/features/categories/view/custom/categories_card.dart';
import 'package:news/Local/features/home/data/static/home_categories.dart';
import '../../../Core/Constant/Routes.dart';
import '../controller/home_controller.dart';
import 'custom/home_categories.dart';
import 'custom/home_news_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<HomeController>(
          builder: (homeController) => HandilingDataView(
            statusRequest: homeController.statusRequest,
            retryFunction: () {
              homeController.fetchData();
            },
            child: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              onRefresh: () {
                return homeController.refreshData();
              },
              child: homeController.isProgreesRefresh
                  ? Container(
                      height: 400,
                    )
                  : SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hot News',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 18.sp),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          homeController.hotNews.isNotEmpty
                              ? SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: homeController.hotNews.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          HomeNewsBar(
                                            onTap: () {
                                              Get.toNamed(
                                                AppRoute.newsDetails,
                                                arguments: {
                                                  'NewsModel': homeController
                                                      .hotNews[index]
                                                },
                                              );
                                            },
                                            model:
                                                homeController.hotNews[index],
                                          )),
                                )
                              : Center(
                                  child: Text(
                                    'No News To Show',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Categories',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 18.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 75,
                            child: ListView.builder(
                              itemCount: categoriesList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => HomeCategories(
                                model: categoriesList[index],
                                onTap: () {
                                  Get.toNamed(AppRoute.categoryNews,
                                      arguments: {
                                        'category': categoriesList[index].name
                                      });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'News',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 18.sp),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoute.allNews);
                                },
                                child: Text(
                                  'See All',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                          homeController.allNews.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: homeController.allNews.length > 5
                                      ? 5
                                      : homeController.allNews.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CategoriesCard(
                                        onTap: () {
                                          Get.toNamed(
                                            AppRoute.newsDetails,
                                            arguments: {
                                              'NewsModel':
                                                  homeController.allNews[index],
                                            },
                                          );
                                        },
                                        article: homeController.allNews[index],
                                      ))
                              : Center(
                                  child: Text(
                                    'No News To Show',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
