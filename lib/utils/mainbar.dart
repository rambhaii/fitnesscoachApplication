import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/cupertino.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class MainBar extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const MainBar({
    Key? key,
    this.image,
    this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Column(
          children: [
            AppHelper.themelight
                ? Image.asset(
                    AppImages.blacklogo,
                    height: 12.h,
                  )
                : Image.asset(
                    AppImages.logo,
                    height: 12.h,
                  )
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          text!,
          style: AppHelper.themelight
              ? AppStyle.cardtitledark.copyWith(fontSize: 17.sp)
              : AppStyle.cardtitle.copyWith(fontSize: 17.sp),
        ),
        SizedBox(
          width: 70.w,
          child: Text(
            subtext!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppHelper.themelight
                ? AppStyle.cardsubtitledark.copyWith(fontSize: 15.sp)
                : AppStyle.cardsubtitle.copyWith(fontSize: 15.sp),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
