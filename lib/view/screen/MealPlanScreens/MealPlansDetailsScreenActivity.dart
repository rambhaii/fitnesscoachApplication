import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/components/mealplanbannerui.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/components/mealplandescUI.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MealPlansDetailsScreenActivity extends StatefulWidget {
  const MealPlansDetailsScreenActivity({super.key});

  @override
  State<MealPlansDetailsScreenActivity> createState() =>
      _MealPlansDetailsScreenActivityState();
}

class _MealPlansDetailsScreenActivityState
    extends State<MealPlansDetailsScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: "7 Days Diet Plan",
            icon2: Icons.share,
          )),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Column(children: [
            MealPlanbannerUI(),
            SizedBox(
              height: 2.h,
            ),
            mealplandescUI(),
            SizedBox(
              height: 5.h,
            ),
          ]),
        ),
      ),
    );
  }
}
