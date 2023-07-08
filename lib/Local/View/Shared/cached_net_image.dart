import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../Global/Core/Constant/Size.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/Images.dart';

class CachedNetImage extends StatelessWidget {
  const CachedNetImage({super.key, required this.url, this.hight, this.width});
  final String url;
  final double? hight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? AppSize.screenWidth,
        height: hight ?? 250,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Container(
            color: AppColors.grey,
            width: AppSize.screenWidth,
            height: 250,
            child: const Icon(
              Icons.error,
              size: 35,
            ),
          ),
          placeholder: (context, load) => Container(
            width: AppSize.screenWidth,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.loadImage))),
          ),
        ));
  }
}
