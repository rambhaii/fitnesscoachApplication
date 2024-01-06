import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubmitButton extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const SubmitButton({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return
     GestureDetector(
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
                  child: 
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Text(
                      widget.text ?? '',
                      style: AppStyle.cardtitle.copyWith(color: Colors.white),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ));
  
  
  }
}
