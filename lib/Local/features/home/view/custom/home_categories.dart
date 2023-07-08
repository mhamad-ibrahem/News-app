import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/Local/features/home/model/categories_model.dart';
import '../../../../Core/Constant/Colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key, required this.model, this.onTap});
  final CategoriesModle model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 83,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 20),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.red.withOpacity(0.3)),
          child: Column(
            children: [
              Center(
                child: Icon(
                  model.image,
                  color: AppColors.red,
                  size: 40,
                ),
              ),
              Text(
                model.name,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }
}
