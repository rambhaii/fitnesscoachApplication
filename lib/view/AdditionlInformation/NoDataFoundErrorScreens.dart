import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';

// ignore: must_be_immutable
class NoDataFoundErrorScreens extends StatelessWidget {
  double? height;
  final String title;
  NoDataFoundErrorScreens({
    super.key,
    this.height,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 75.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.error,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                title,
                style: AppHelper.themelight
                    ? AppStyle.cardsubtitledark
                    : AppStyle.cardsubtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
