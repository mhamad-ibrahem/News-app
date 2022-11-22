import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Main/Categories/categoriesCard.dart';
import '../../../Constant/Constant.dart';
import '../../../Controller/News/NewsController.dart';
import '../../../Model/Articles.dart';
import '../../Details/DetailsCreen.dart';
import '../Drawer/Drawer.dart';

class CategoriesScreen extends StatelessWidget {
  NewsController controller = Get.put(NewsController());
  final String appBarText;
  final String category;

  CategoriesScreen(
      {super.key, required this.appBarText, required this.category});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        appBar: AppBar(
          backgroundColor: red,
          title: Text(
            appBarText,
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: ListView(
                      //Show Data From api
                      children: [
                        FutureBuilder(
                            future: controller.getData(category),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Article>?> snapshoot) {
                              if (snapshoot.connectionState ==
                                  ConnectionState.waiting) {
                                //for waiting state until get data
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (!snapshoot.hasData) {
                                //if there are no data
                                return Center(
                                    child: Text(
                                  'No news to show now'.tr,
                                  style: Get.textTheme.headline4,
                                ));
                              }
                              if (snapshoot.hasData) {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshoot.data!.length,
                                  itemBuilder: ((context, index) =>
                                      CategoriesCard(
                                        title: snapshoot.data![index].title!,
                                        description:
                                            snapshoot.data![index].description!,
                                        imageUrl:
                                            snapshoot.data![index].urlToImage!,
                                        fun: () {
                                          Get.to(() => DetailsScreen(),
                                              arguments: {
                                                // the ?? for any error or dameging data
                                                // ignore: unnecessary_null_comparison
                                                'image': snapshoot.data![index]
                                                        .urlToImage ??
                                                    'https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg',
                                                'title': snapshoot
                                                        .data![index].title ??
                                                    'empty'.tr,
                                                'subTitle': snapshoot.data![index]
                                                        .description ??
                                                    'empty'.tr,
                                                'contnet': snapshoot
                                                        .data![index].content ??
                                                    'empty'.tr,
                                                'authour': snapshoot
                                                        .data![index].author ??
                                                    'empty'.tr,
                                                'dateTime': snapshoot.data![index]
                                                        .publishedAt ??
                                                    'empty'.tr,
                                              },
                                              transition: Transition.fade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                      )),
                                );
                              } else {
                                print(
                                    '================================================');
                                print('${snapshoot.data!.length}');
                              }
                              return Center(
                                  child: Text(
                                'Loading......'.tr,
                                style: Theme.of(context).textTheme.headline4,
                              ));
                            }),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
