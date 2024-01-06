import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/welcomebutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreenActivity extends StatefulWidget {
  const WelcomeScreenActivity({super.key});

  @override
  State<WelcomeScreenActivity> createState() => _WelcomeScreenActivityState();
}

class _WelcomeScreenActivityState extends State<WelcomeScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.2, 0.7, 1.6],
            colors: [
              AppColors.welcomecolor,
              Colors.white,
              Colors.white,
              AppColors.welcomecolor,
            ],
          )),
        ),
        Column(
          children: [
            Image.asset(
              AppImages.welcomescreenillimage,
              //   height: 60.h,
              // width: 60.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            RichText(
              text: TextSpan(
                text: "CoachBy",
                style: AppStyle.welcometext,
                children: <TextSpan>[
                  TextSpan(
                      text: "${AppStringFile.app}",
                      style: AppStyle.welcometextprimecolor),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              Languages.of(context)!.welcomemessage,
              style: AppStyle.welcomesubtext,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            WelcomeButtonWidget(
              width: 50.w,
              boxcolor: Colors.black,
              text: Languages.of(context)!.welcomebtnname,
              onTap: () {
                Navigator.pushNamed(context, Routes.onboardingScreen);
              },
            ),
          ],
        )
      ])),
    );
  }
}
