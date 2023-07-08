import 'package:flutter/material.dart';
import 'Colors.dart';

TextStyle purpleTextStyle(bool isUnderLine) {
  return TextStyle(
      color: AppColors.primaryColor,
      fontSize: 22,
      decoration:
          isUnderLine == true ? TextDecoration.underline : TextDecoration.none,
      fontWeight: FontWeight.w600);
}

TextStyle buttonTextStyle() {
  return const TextStyle(
      color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w600);
}

TextStyle textFormStyle() {
  return const TextStyle(
      color: AppColors.black, fontSize: 15, fontWeight: FontWeight.bold);
}

TextStyle appBarStyle() {
  return const TextStyle(
      color: AppColors.black, fontSize: 15, fontWeight: FontWeight.bold);
}
