import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final double? width;
  final double? height;
  final Function()? onTap;
  const ButtonWidget(
      {Key? key,
      this.image,
      this.text,
      this.onTap,
      this.boxcolor,
      this.textcolor,
      this.width,
      this.height})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 6.h,
        width: widget.width ?? 100.w,
        decoration: BoxDecoration(
            color: AppHelper.themelight
                ? AppColors.primarycolorYellow
                : AppColors.primarycolor,
            border: Border.all(
              color: AppHelper.themelight
                  ? AppColors.primarycolorYellow
                  : AppColors.primarycolor,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text ?? ''.toUpperCase(),
              style: AppStyle.onbaordtitle.copyWith(
                  color: widget.textcolor ?? Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
