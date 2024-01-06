import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/components/mealplanui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MealPlanScreenActivity extends StatefulWidget {
  const MealPlanScreenActivity({super.key});

  @override
  State<MealPlanScreenActivity> createState() => _MealPlanScreenActivityState();
}

class _MealPlanScreenActivityState extends State<MealPlanScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.mealplan,
          )),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "7 Days Diet Plan",
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark.copyWith(fontSize: 18.sp)
                      : AppStyle.cardtitle.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            MealDietPlanUI(
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.mealPlansDetailsScreenActivity);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
          ]),
        ),
      ),
    );
  }
}
