import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/View/Details/DetailsBody.dart';
import '../../Controller/News/NewsController.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  NewsController controller = Get.put(NewsController());
  
  String title = Get.arguments['title'];
  String description = Get.arguments['subTitle'];
  String imageUrl = Get.arguments['image'];
  String content = Get.arguments['contnet'];
  String author = Get.arguments['authour'];
  DateTime time = Get.arguments['dateTime'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsBody(
                    text: title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  DetailsBody(
                    text: 'Desricption :'.tr,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DetailsBody(
                    text: description,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  DetailsBody(
                    text: 'Content :'.tr,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DetailsBody(
                    text: content,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  DetailsBody(
                    text: 'Author :'.tr,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DetailsBody(
                    text: author,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  DetailsBody(
                    text: 'Published At :'.tr,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  DetailsBody(
                    text: '$time',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
