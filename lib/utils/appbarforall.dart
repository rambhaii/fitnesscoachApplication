import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';

class AppBarScreens extends StatelessWidget {
  final String title;
  final IconData? icon1;
  final IconData? icon2;
  final double? size;
  final Color? color1;
  final Color? color2;
  final Function()? onTap;
  const AppBarScreens(
      {super.key,
      required this.title,
      this.icon1,
      this.icon2,
      this.color1,
      this.color2,
      this.size,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: color1 ?? Theme.of(context).colorScheme.primary,
      ),
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: AppHelper.themelight
            ? AppStyle.cardtitledark.copyWith(fontSize: 18.sp)
            : AppStyle.cardtitle.copyWith(fontSize: 18.sp),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: onTap,
                icon: Icon(icon2),
                color: color2 ?? Theme.of(context).colorScheme.primary),
          ],
        ),
      ],
    );
  }
}
