import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class InternetNotAvailable extends StatelessWidget {
  double? height;
  InternetNotAvailable({super.key, double? height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 55.h,
        width: 50.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.nointernet,
                  color: AppColors.greyColor.withOpacity(0.3)),
              Text(
                Languages.of(context)!.nointernetconnection,
                style: AppStyle.cardtitle.copyWith(
                    color: AppColors.greyColor.withOpacity(0.5),
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
