import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.primary,
            size: 2.4.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: AppHelper.themelight
                ? AppStyle.cardtitledark
                : AppStyle.cardtitle,
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
