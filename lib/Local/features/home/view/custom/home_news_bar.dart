import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/Global/Core/Constant/Size.dart';
import 'package:news/Local/Core/Constant/Colors.dart';
import 'package:news/Local/View/Shared/cached_net_image.dart';
import 'package:news/Local/features/categories/model/news_model.dart';

class HomeNewsBar extends StatelessWidget {
  const HomeNewsBar({super.key, required this.model, this.onTap});
  final Article model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetImage(
              url: model.urlToImage!,
              width: AppSize.screenWidth * 0.8,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Text(
              model.title!,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}
