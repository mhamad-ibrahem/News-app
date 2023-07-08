import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../controller/news_details_controller.dart';

class NewsDetailsPopUpMenu extends StatelessWidget {
  NewsDetailsPopUpMenu({super.key});
  final NewsDetailsController controller = Get.find();
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.black.withOpacity(0.6)),
      child: PopupMenuButton(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        icon: const Icon(
          Icons.more_vert_rounded,
          color: AppColors.white,
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: GestureDetector(
              onTap: () {
                controller.saveImageToGalery(controller.model.urlToImage!);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.download,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Download',
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
            )),
            PopupMenuItem(
                child: GestureDetector(
              onTap: () {
                controller.shareNewsImage(
                    controller.model.title, controller.model.urlToImage!);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Share', style: Theme.of(context).textTheme.headline3),
                ],
              ),
            )),
          ];
        },
      ),
    );
  }
}
