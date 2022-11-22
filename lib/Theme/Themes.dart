
import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,
    textTheme:  TextTheme(
      headline1:
          TextStyle(fontSize: 34, color: black, fontWeight: FontWeight.w600),
          headline2:
          TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w700),
          headline3:
          TextStyle(fontSize: 13, color: lblack, fontWeight: FontWeight.w500),
          headline4:
          TextStyle(fontSize: 18, color: black, fontWeight: FontWeight.w600),
          headline5:
          TextStyle(fontSize: 15, color: black, fontWeight: FontWeight.w500),
          headline6:
          TextStyle(fontSize:15, color:amber, fontWeight: FontWeight.w600),
    ),
    primaryIconTheme: IconThemeData(color: black),
        primaryColor: Colors.grey.shade200,
        accentColor: dGrey,
        
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: black,
    brightness: Brightness.dark,
    textTheme:  TextTheme(
      headline1:
          TextStyle(fontSize: 34, color: white, fontWeight: FontWeight.w600),
          headline2:
          TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w700),
          headline3:
          const TextStyle(fontSize: 13, color: Colors.white54, fontWeight: FontWeight.w500),
          headline4:
          TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.w600),
          headline5:
          TextStyle(fontSize: 15, color: white, fontWeight: FontWeight.w500),
          headline6:
          TextStyle(fontSize: 15, color: red, fontWeight: FontWeight.w600),
    ),
    primaryIconTheme: IconThemeData(color: white),
    backgroundColor: dGrey,
   
    snackBarTheme: SnackBarThemeData(
      backgroundColor:dGrey,
    ),
    primaryColor:dGrey,
    accentColor: white,

  );
}


