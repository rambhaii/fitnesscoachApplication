import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanfourUiScreenACtivity extends StatelessWidget {
  final String title;
  final String subtitle;
  final String kclamount;
  final Function()? optional_ingredient;
  final Function()? onTap;
  const CoachmanfourUiScreenACtivity(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.kclamount,
      this.onTap,
      this.optional_ingredient});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              SizedBox(height: 8.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: AppHelper.themelight
                        ? AppStyle.cardtitledark.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp)
                        : AppStyle.cardtitle.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                  ),
                  Text(
                    kclamount,
                    style: AppHelper.themelight
                        ? AppStyle.cardtitledark.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp)
                        : AppStyle.cardtitle.copyWith(
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () 
                    {
                      optional_ingredient!();
                    },
                    child: 

                        Text(
                      Languages.of(context)!.option,
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark.copyWith(
                              color: AppColors.primarycolorYellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp)
                          : AppStyle.cardtitle.copyWith(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
