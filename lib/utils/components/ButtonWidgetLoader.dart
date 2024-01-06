import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidgetLoader extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidgetLoader({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidgetLoader> createState() => _ButtonWidgetLoaderState();
}

class _ButtonWidgetLoaderState extends State<ButtonWidgetLoader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 12.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(2.w),
              topLeft: Radius.circular(2.w),
            ),
            //  border: Border.all(color: AppColors.whiteColor, width: 1),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 6.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppHelper.themelight
                        ? AppColors.primarycolorYellow
                        : AppColors.primarycolor,
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppHelper.themelight
                                  ? AppColors.primarycolor
                                  : AppColors.primarycolorYellow,
                            ),
                          ))),
                ),
              ),
            ],
          ),
        ));
  }
}
