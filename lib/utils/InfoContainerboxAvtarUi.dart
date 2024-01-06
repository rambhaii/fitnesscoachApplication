import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoContainerboxAvtarUi extends 
StatelessWidget 
{
  final String title;
  final String subtitle;
  final String image;
  final Function()? onTap;
  const InfoContainerboxAvtarUi(
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
        height: 50.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1.h)),
          color: Theme.of(context).cardTheme.color,
          border: Border.all(color: AppColors.greyColor, width: 1),
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  title,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark
                      : AppStyle.cardtitle,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 40.h,
                    width: 100.w,
                    child: GifView.asset(
                      image,

                      // width: 200,

                      // frameRate: 30, // default is 15 FPS
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
