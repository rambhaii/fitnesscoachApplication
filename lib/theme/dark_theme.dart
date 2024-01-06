import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData darktheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 17.sp),
    ),
    cardTheme: CardTheme(color: AppColors.darkcarprimarycolor),
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.grey[800]!,
      brightness: Brightness.dark,
    ));
