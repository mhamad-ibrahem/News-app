import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Local/Core/Constant/Colors.dart';
import 'package:news/Local/features/news_details/controller/news_details_controller.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../View/Shared/cached_net_image.dart';
import 'news_details_pop_up.dart';

class NewsDetailsImage extends StatelessWidget {
  NewsDetailsImage({
    super.key,
  });
  final NewsDetailsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          Material(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                PhotoView(
                  imageProvider:
                      CachedNetworkImageProvider(controller.model.urlToImage!),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                ),
              ],
            ),
          ),
        );
      },
      child: Stack(
        children: [
          CachedNetImage(url: controller.model.urlToImage!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.black.withOpacity(0.6)),
                child: const BackButton(
                  color: AppColors.white,
                ),
              ),
              NewsDetailsPopUpMenu()
            ],
          ),
        ],
      ),
    );
  }
}
