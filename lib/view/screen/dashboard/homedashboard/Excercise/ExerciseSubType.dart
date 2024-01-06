import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/ExcercisePlan.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExerciseSubType extends StatefulWidget {
  final Data trainingType;
  const ExerciseSubType({super.key, required this.trainingType});

  @override
  State<ExerciseSubType> createState() => _ExerciseSubTypeState();
}

class _ExerciseSubTypeState extends State<ExerciseSubType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              title: Languages.of(context)!.training,
            )),
        body: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: widget.trainingType.dayList!.isNotEmpty
              ? ListView.builder(
                  itemCount: widget.trainingType.dayList!.length,
                  itemBuilder: (context, position) {
                    final value = widget.trainingType.dayList![position];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 700),
                                child: ExcercisePlan(
                                  dayList: value,
                                )));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                value.dayName.toString(),
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 700),
                                            child: ExcercisePlan(
                                              dayList: value,
                                            )));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    //size: 2.5.h,
                                    color: AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor,
                                  )),
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
        ));
  }
}
