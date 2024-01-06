import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class mealplandescUI extends StatelessWidget {
  const mealplandescUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      width: 100.w,

      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(1.h),
      ),

      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "7 Days Diet Plan",
              style: AppHelper.themelight
                  ? AppStyle.cardtitledark
                      .copyWith(fontSize: 18.sp, color: AppColors.primarycolor)
                  : AppStyle.cardtitle
                      .copyWith(fontSize: 18.sp, color: AppColors.blackColor),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "BreakFast-",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark.copyWith(fontSize: 16.5.sp)
                  : AppStyle.cardsubtitle.copyWith(fontSize: 16.5.sp),
            ),
            Text(
              "How do I make a 7 day diet plan? \nHere is a breakdown of the GM diet plan and which food groups you can consume. \nDiet Day 1 – Fruits only. \nDiet Day 2 – Vegetables only. \nDiet Day 3 – Fruits and vegetables. \nDiet Day 4 – Bananas and milk. \nDiet Day 5 – Meat. \nDiet Day 6 – Meat and vegetables. \nDiet Day 7 – Rice, fruit and vegetable juice.",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark
                  : AppStyle.cardsubtitle,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Snack-",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark.copyWith(fontSize: 16.5.sp)
                  : AppStyle.cardsubtitle.copyWith(fontSize: 16.5.sp),
            ),
            Text(
              "1/2 cup fat free coffiee \n1/2 cup fat free coffiee \nDiet Day 2 – Vegetables only. ",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark
                  : AppStyle.cardsubtitle,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Lunch-",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark.copyWith(fontSize: 16.5.sp)
                  : AppStyle.cardsubtitle.copyWith(fontSize: 16.5.sp),
            ),
            Text(
              "How do I make a 7 day diet plan? \nHere is a breakdown of the GM diet plan \n1/2 cup fat free coffiee \n1/2 cup fat free coffiee \nDiet Day 2 – Vegetables only. ",
              style: AppHelper.themelight
                  ? AppStyle.cardsubtitledark
                  : AppStyle.cardsubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
