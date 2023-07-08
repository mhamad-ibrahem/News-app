import 'package:flutter/material.dart';
import 'package:news/Global/Core/Constant/Size.dart';
import 'package:news/Local/Core/Constant/Colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSize.screenHight * 0.2,
        ),
        const CircularProgressIndicator(
          color: AppColors.primaryColor,
        )
      ],
    );
  }
}
