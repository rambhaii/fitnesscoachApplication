import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoContainerboxUI extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Function()? onTap;
  const InfoContainerboxUI(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1.h)),
          color: Theme.of(context).cardTheme.color,
          border: Border.all(color: AppColors.greyColor, width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                  width: 20.w,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    color: AppColors.greyColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark
                      : AppStyle.cardtitle,
                ),
                Text(
                  subtitle,
                  style: AppHelper.themelight
                      ? AppStyle.cardsubtitledark
                      : AppStyle.cardsubtitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
