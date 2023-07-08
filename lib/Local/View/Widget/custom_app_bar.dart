import 'package:flutter/material.dart';
import '../../Core/Constant/Colors.dart';

PreferredSizeWidget customAppBar({required String title, Widget? leading}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    title: Text(
      title,
      style: const TextStyle(
          color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    leading: leading,
  );
}
