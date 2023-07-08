import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/features/categories/model/news_model.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../controller/news_details_controller.dart';
import 'new_details_body.dart';

class NewsDetailsTextBody extends StatelessWidget {
  NewsDetailsTextBody({super.key, required this.model});
  final Article model;
  final NewsDetailsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DetailsBody(
            text: model.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: DetailsBody(
                  text: 'Desricption :',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 10),
                width: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(25))),
                child: GetBuilder<NewsDetailsController>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          controller.changeFave();
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          size: 35,
                          color: controller.model.isLiked!
                              ? AppColors.primaryColor
                              : AppColors.grey,
                        ))),
              ),
            ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsBody(
                text: model.description,
                style: Theme.of(context).textTheme.headline3,
              ),
              DetailsBody(
                text: 'Content :',
                style: Theme.of(context).textTheme.headline6,
              ),
              DetailsBody(
                text: model.content,
                style: Theme.of(context).textTheme.headline3,
              ),
              DetailsBody(
                text: 'Author :',
                style: Theme.of(context).textTheme.headline6,
              ),
              DetailsBody(
                text: model.author,
                style: Theme.of(context).textTheme.headline3,
              ),
              DetailsBody(
                text: 'Published At :',
                style: Theme.of(context).textTheme.headline6,
              ),
              DetailsBody(
                text: '${model.publishedAt}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
