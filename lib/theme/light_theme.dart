import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData lighttheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundColorLight,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 17.sp),
  ),
  cardTheme: CardTheme(color: AppColors.appcardColor),
  colorScheme: ColorScheme.dark(
    background: AppColors.backgroundColorLight,
    primary: Colors.black,
    secondary: Colors.grey[300]!,
    onPrimary: Colors.white,
    brightness: Brightness.light,
  ),
);
