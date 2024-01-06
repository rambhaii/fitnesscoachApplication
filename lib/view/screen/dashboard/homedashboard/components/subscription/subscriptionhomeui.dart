import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubscriptionHomeUiScreenACtivity extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const SubscriptionHomeUiScreenACtivity(
      {super.key, required this.title, required this.icon, this.onTap});

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
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Icon(
                icon,
                color: AppHelper.themelight
                    ? AppColors.primarycolorYellow
                    : AppColors.primarycolor,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              title,
              style: AppHelper.themelight
                  ? AppStyle.cardtitledark
                  : AppStyle.cardtitle,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined)
          ]),
        ),
      ),
    );
  }
}
