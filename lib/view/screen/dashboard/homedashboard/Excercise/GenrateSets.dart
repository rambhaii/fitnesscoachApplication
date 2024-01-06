import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenrateSet extends StatelessWidget {
  const GenrateSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 4.h,
          width: 10.w,
          child: Center(
            child: TextField(
              // controller: repsControlletr,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: AppStyle.cardsubtitle.copyWith(
                color: AppHelper.themelight
                    ? AppColors.primarycolorYellow
                    : AppColors.primarycolor,
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0.h,
                ),
                hintText: "00",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   width: 3.w,
        // ),
        // Container(
        //   height: 4.h,
        //   width: 10.w,
        //   child: TextField(
        //     // controller: weightControlletr,
        //     textAlign: TextAlign.center,
        //     keyboardType: TextInputType.number,
        //     style: AppStyle.cardsubtitle.copyWith(
        //       color: AppColors.blackColor,
        //       fontSize: 16.sp,
        //     ),
        //     decoration: InputDecoration(
        //       contentPadding: EdgeInsets.symmetric(
        //         vertical: 0.h,
        //       ),
        //       hintText: "00",
        //       border: OutlineInputBorder(),
        //       focusedBorder: OutlineInputBorder(),
        //     ),
        //   ),
        // ),
      ],
    );
    
  }
}
