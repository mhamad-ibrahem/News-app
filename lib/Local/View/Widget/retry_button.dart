import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/Local/Core/Constant/Colors.dart';

import '../../../Global/Core/Constant/Size.dart';
import '../../Core/Constant/TextStyles.dart';

class RetryButton extends StatelessWidget {
  const RetryButton(
      {super.key,
      required this.textError,
      required this.hight,
      required this.retryFunction});
  final String textError;
  final double hight;
  final void Function()? retryFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSize.screenWidth,
          height: hight,
        ),
        Text(textError,
            style: buttonTextStyle().copyWith(color: AppColors.primaryColor)),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: retryFunction,
            child: Text("Retry",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 16.sp)))
      ],
    );
  }
}
