import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/DietPlanModel.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coackmanscreenUI.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanthreeScreenActivity extends StatefulWidget {
  final String title;
  final DayLists dayList;
  const CoachmanthreeScreenActivity(
      {super.key, required this.title, required this.dayList});

  @override
  State<CoachmanthreeScreenActivity> createState() =>
      _CoachmanthreeScreenActivityState();
}

class _CoachmanthreeScreenActivityState
    extends State<CoachmanthreeScreenActivity> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: widget.title,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: widget.dayList.mealPlanDetail != null
              ? Column(
                  children: [
                    widget.dayList.mealPlanDetail!.mealPlanList!.isNotEmpty
                        ? ListView.builder(
                            itemCount: widget
                                .dayList.mealPlanDetail!.mealPlanList!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 2.h,
                                    left: 2.h,
                                    right: 2.h,
                                    bottom: 0.2.h),
                                child: CoachmanUiScreenACtivity(
                                  title: widget.dayList.mealPlanDetail!
                                          .mealPlanList![index].name
                                          .toString(),
                                  icon: Icons.donut_large_sharp,
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.coachmanfourScreenActivity,
                                        arguments: {
                                          AppStringFile.title: widget
                                                  .dayList
                                                  .mealPlanDetail!
                                                  .mealPlanList![index]
                                                  .name
                                                  .toString(),
                                          AppStringFile.mealPlanList: widget
                                              .dayList
                                              .mealPlanDetail!
                                              .mealPlanList![index],
                                        });
                                  },
                                ),
                              );
                            })
                        : NoDataFoundErrorScreens(
                            title: Languages.of(context)!.nodatafound,
                          ),
                  ],
                )
              : NoDataFoundErrorScreens(
                  title: Languages.of(context)!.nodatafound,
                ),
        ),
      ),
    );
  }
}
