import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Global/Core/Constant/Size.dart';
import 'package:news/Local/View/Widget/CustomButton.dart';
import 'package:news/Local/features/favorite/controller/favorite_controller.dart';

import '../../categories/view/custom/categories_card.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});
  final FavoriteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<FavoriteController>(
          builder: (controller) => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.favoriteList.length,
                          itemBuilder: (context, index) => CategoriesCard(
                              onPressed: () {
                                controller.removeFromFavorite(index);
                              },
                              isFavorite: true,
                              onTap: () {},
                              article: controller.favoriteList[index])),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  buttonBody: 'Remove All',
                  onTap: () {
                    controller.removeAll();
                  },
                  buttonWidth: AppSize.screenWidth),
            ],
          ),
        ),
      ),
    );
  }
}
