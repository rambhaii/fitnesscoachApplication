import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Settingwidgetui extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const Settingwidgetui(
      {super.key, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 2.5.h,
                color: AppHelper.themelight
                    ? AppColors.primarycolorYellow
                    : AppColors.primarycolor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                title,
                style: AppHelper.themelight
                    ? AppStyle.cardsubtitledark
                    : AppStyle.cardsubtitle,
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 2.5.h,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
