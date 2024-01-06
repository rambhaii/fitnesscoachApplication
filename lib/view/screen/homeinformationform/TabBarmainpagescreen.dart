import 'package:alpersonalcoachingapp/api/WeeklyUpdateApi.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/components/ButtonWidgetLoader.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformScreen.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformthree.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformtwo.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageinfotabbarSCreenActivity extends StatefulWidget {
  const HomepageinfotabbarSCreenActivity({super.key});

  @override
  State<HomepageinfotabbarSCreenActivity> createState() =>
      _HomepageinfotabbarSCreenActivityState();
}

class _HomepageinfotabbarSCreenActivityState
    extends State<HomepageinfotabbarSCreenActivity> {
  WeeklyUpdateApi api = WeeklyUpdateApi();
  double selectedvalue = 0.33;
  int _currentIndex = 0;
  String buttonvalue = 'Next';
  String appbarTitle = "";
  String message = "0.0%";
  bool isLoading = false;

  List tabs = [];
  fetdata() {
    tabs = [
      HomeInformationFormScreenActivity(),
      Homeinformationformtwo(),
      Homeinformationformthree(),
    ];
  }

  @override
  void initState() {
    fetdata();
    super.initState();
  }
 
  




  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 0) {
      buttonvalue = Languages.of(context)!.next;
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          bottomNavigationBar: !isLoading
              ? SubmitButton(
                  text: buttonvalue,
                  onTap: () async {
                    if (_currentIndex == 0) {
                      print("dfkjhg");
                      buttonvalue = Languages.of(context)!.next;
                      appbarTitle = Languages.of(context)!.weeklyPrevious;
                      setState(() {
                        selectedvalue = selectedvalue + 0.33;
                        message = "33 %";
                        _currentIndex = _currentIndex + 1;
                      });
                    } else if (_currentIndex == 1) {
                      appbarTitle = Languages.of(context)!.Nextweeke;
                      buttonvalue = Languages.of(context)!.save;
                      setState(() {
                        if (isLoading) {
                          return;
                        }
                        message = "70 %";
                        selectedvalue = selectedvalue + 0.34;
                        _currentIndex = _currentIndex + 1;
                      });
                    } else if (_currentIndex == 2) {
                      setState(() {
                        isLoading = true;
                        buttonvalue = Languages.of(context)!.save;
                      });

                      bool? status = await api.updateData();
                      if (status == true) {
                        isLoading = false;
                        Navigator.pop(context);

                        Navigator.pushNamed(context, Routes.dashBoardScreenActivity);

                        DialogHelper.showFlutterToast(
                            strMsg: Languages.of(context)!.savedMessage);
                      } else {
                        DialogHelper.showFlutterToast(
                            strMsg: Languages.of(context)!.somethingWentWrong);
                        Navigator.pop(context);
                      }
                    }
                  },
                )
              : ButtonWidgetLoader(),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppHelper.themelight
                ? AppColors.primarycolorYellow
                : AppColors.primarycolor,
            iconTheme: IconThemeData(color: AppColors.whiteColor),
            elevation: 0,
            centerTitle: true,
            title: Text(
              _currentIndex == 0
                  ? Languages.of(context)!.weeklyProgress
                  : appbarTitle,
              style: AppStyle.cardtitle
                  .copyWith(fontSize: 18.sp, color: Colors.white),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(6.0),
              child: LinearPercentIndicator(
                animation: true,
                lineHeight: 15.0,
                animationDuration: 2500,
                percent: selectedvalue,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
                barRadius: Radius.circular(10),
              ),
              //  LinearProgressIndicator(
              //   backgroundColor: Colors.red.withOpacity(0.3),
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              //   value: selectedvalue,
              //   minHeight: 1.h,
              // ),
            ),
          ),
          body: SafeArea(child: tabs[_currentIndex])),
    );
  }
}
