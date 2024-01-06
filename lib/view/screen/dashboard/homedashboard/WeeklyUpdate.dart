import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformthree.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeeklyUpdate extends StatefulWidget {
  const WeeklyUpdate({super.key});

  @override
  State<WeeklyUpdate> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeeklyUpdate> {
  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
        bottomNavigationBar: SubmitButton(
          text: "Forsatt",
          onTap: () {},
        ),
        appBar: AppBar(
          backgroundColor: AppHelper.themelight
              ? AppColors.primarycolorYellow
              : AppColors.primarycolor,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            Languages.of(context)!.weekly,
            style: AppStyle.cardtitle
                .copyWith(fontSize: 18.sp, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearPercentIndicator(
                  // width: 1000.w,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                  backgroundColor: Colors.white,
                  barRadius: Radius.circular(50)),
              Text(
                "data",
                style: TextStyle(color: Colors.amber),
              ),
              SizedBox(
                height: 100.h,
              ),
              Homeinformationformthree(),
            ],
          ),
        ));
  }
}
