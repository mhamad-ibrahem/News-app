import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Local/Core/Constant/Colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 34.sp, color: AppColors.black, fontWeight: FontWeight.w600),
      headline2: TextStyle(
          fontSize: 20.sp, color: AppColors.black, fontWeight: FontWeight.w700),
      headline3: TextStyle(
          fontSize: 13.sp,
          color: AppColors.lblack,
          fontWeight: FontWeight.w500),
      headline4: TextStyle(
          fontSize: 18.sp, color: AppColors.black, fontWeight: FontWeight.w600),
      headline5: TextStyle(
          fontSize: 15.sp, color: AppColors.black, fontWeight: FontWeight.w500),
      headline6: TextStyle(
          fontSize: 15.sp, color: AppColors.red, fontWeight: FontWeight.w600),
    ),
    primaryIconTheme: const IconThemeData(color: AppColors.black),
    primaryColor: Colors.grey.shade200,
    hintColor: AppColors.dGrey,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 34.sp, color: AppColors.white, fontWeight: FontWeight.w600),
      headline2: TextStyle(
          fontSize: 20.sp, color: AppColors.white, fontWeight: FontWeight.w700),
      headline3: TextStyle(
          fontSize: 13.sp, color: Colors.white54, fontWeight: FontWeight.w500),
      headline4: TextStyle(
          fontSize: 17.sp, color: AppColors.white, fontWeight: FontWeight.w600),
      headline5: TextStyle(
          fontSize: 15.sp, color: AppColors.white, fontWeight: FontWeight.w500),
      headline6: TextStyle(
          fontSize: 15.sp, color: AppColors.red, fontWeight: FontWeight.w600),
    ),
    primaryIconTheme: const IconThemeData(color: AppColors.white),
    backgroundColor: AppColors.dGrey,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.dGrey,
    ),
    primaryColor: AppColors.dGrey,
    hintColor: AppColors.white,
  );
}
