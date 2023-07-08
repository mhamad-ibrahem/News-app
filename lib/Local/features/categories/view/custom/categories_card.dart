import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/features/categories/model/news_model.dart';

import '../../../../View/Shared/cached_net_image.dart';
import '../../../../View/Widget/CustomExitButton.dart';

class CategoriesCard extends StatelessWidget {
  final VoidCallback onTap;
  final Article article;
  final bool isFavorite;
  final void Function()? onPressed;
  const CategoriesCard({
    super.key,
    this.onPressed,
    required this.onTap,
    required this.article,
    this.isFavorite = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetImage(
                  url: article.urlToImage!,
                ),
              ),
              isFavorite
                  ? Positioned(
                      top: 10,
                      right: 10,
                      child: CustomExitButton(
                        onPressed: onPressed,
                      ))
                  : const SizedBox(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  article.title!,
                  style: Get.textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(article.description!, style: Get.textTheme.headline3),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
