import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/SliderScreen.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/test.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExcercisePlan extends StatefulWidget {
  final DayList dayList;
  const ExcercisePlan({super.key, required this.dayList});

  @override
  State<ExcercisePlan> createState() => _ExcercisePlan();
}

class _ExcercisePlan extends State<ExcercisePlan> {
  @override
  void initState() {
    super.initState();
    // enterFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    print("fsxdgdsfgdfg ${widget.dayList.exerciseDayList!.length}");
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Stack(
        children: [
          SliderScreen(),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Languages.of(context)!.trainingVedio,
                          style: AppHelper.themelight
                              ? AppStyle.onbaordtitle
                              : AppStyle.welcometext,
                        ),
                        Row(children: [
                          Image(
                            image: AssetImage("assets/images/fitnes.png"),
                            width: 15,
                            height: 20,
                            color: AppHelper.themelight
                                ? AppColors.whiteColor
                                : AppColors.primarycolor,
                          ),
                          Text(
                            " " +
                                widget.dayList.exerciseDayList!.length
                                    .toString() +
                                " " +
                                Languages.of(context)!.totalExcercise,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                : AppStyle.cardsubtitle,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 0.h),
                      child: widget.dayList.exerciseDayList!.isNotEmpty &&
                              widget.dayList.exerciseDayList != null
                          ? ListView.builder(
                              itemCount: widget.dayList.exerciseDayList!.length,
                              itemBuilder: (context, position) {
                                final value =
                                    widget.dayList.exerciseDayList![position];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 700),
                                            child: CustomList(
                                              title: value.exerciseDetail!.title
                                                  .toString(),
                                              exerciseDayList: value,
                                            )));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            value.exerciseDetail != null
                                                ? value.exerciseDetail!.title
                                                        .toString() ??
                                                    ""
                                                : "",
                                            style: AppHelper.themelight
                                                ? AppStyle.cardsubtitledark
                                                : AppStyle.cardsubtitle,
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            //size: 2.5.h,
                                            color: AppHelper.themelight
                                                ? AppColors.primarycolorYellow
                                                : AppColors.primarycolor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : NoDataFoundErrorScreens(
                              title: Languages.of(context)!.nodatafound,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            width: 45,
            left: 12,
            top: 40,
            child: Container(
              width: 4.w,
              height: 4.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.brown.withOpacity(0.5)),
              child: InkWell(
                onTap: () {
                  //exitFullScreen();

                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 5.w,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
