import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MealPlanbannerUI extends StatefulWidget {
  const MealPlanbannerUI({
    super.key,
  });

  @override
  State<MealPlanbannerUI> createState() => _MealPlanbannerUIState();
}

class _MealPlanbannerUIState extends State<MealPlanbannerUI> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 22.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.5.h),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/diet4.png"),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.h),
          child: CircleAvatar(
            radius: 4.w,
            backgroundColor: AppColors.whiteColor,
            child: Icon(
              fav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
