import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/DietPlanModel.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coackmanscreenUI.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmantwoScreenActivity extends StatefulWidget {
  final String title;
  final DietPlanData dietPlanData;
  const CoachmantwoScreenActivity(
      {super.key, required this.title, required this.dietPlanData});

  @override
  State<CoachmantwoScreenActivity> createState() =>
      _CoachmantwoScreenActivityState();
}

class _CoachmantwoScreenActivityState extends State<CoachmantwoScreenActivity> {
  @override
  Widget build(BuildContext context) {
    print("dkfjhgfd");
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: widget.title,
        ),
      ),
      body: SafeArea(
        child: widget.dietPlanData != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    widget.dietPlanData.dayList!.isNotEmpty
                        ? ListView.builder(
                            itemCount: widget.dietPlanData.dayList!.length,
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
                                  title: widget
                                      .dietPlanData.dayList![index].dayName
                                      .toString(),
                                  icon: Icons.donut_large_sharp,
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.coachmanthreeScreenActivity,
                                        arguments: {
                                          AppStringFile.title: widget
                                              .dietPlanData
                                              .dayList![index]
                                              .dayName
                                              .toString(),
                                          AppStringFile.daylist: widget
                                              .dietPlanData.dayList![index],
                                        });
                                  },
                                ),
                              );
                            })
                        : NoDataFoundErrorScreens(
                            title: Languages.of(context)!.nodatafound,
                          ),
                  ],
                ),
              )
            : Center(
                child: LoaderScreen(),
              ),
      ),
    );
  }
}
