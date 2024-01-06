import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MealDietPlanUI extends StatefulWidget {
  final Function()? onTap;

  const MealDietPlanUI({super.key, this.onTap});

  @override
  State<MealDietPlanUI> createState() => _MealDietPlanUIState();
}

class _MealDietPlanUIState extends State<MealDietPlanUI> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: InkWell(
            onTap: widget.onTap,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 22.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5.h),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(1),
                        Colors.white.withOpacity(0.9),
                      ],
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: AssetImage("assets/images/diet4.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 14.h),
                        child: Text(
                         "${Languages.of(context)!.sevenDaysdietPlan}, - ${Languages.of(context)!.day} 1",
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark.copyWith(fontSize: 16.sp)
                              : AppStyle.cardtitledark
                                  .copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
