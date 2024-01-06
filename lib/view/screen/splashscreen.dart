import 'dart:async';
import 'dart:io';
import 'package:alpersonalcoachingapp/api/locdb.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/FirebaseNotificationUtils.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/apphelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    FirebaseNotificationUtils().requestingPermissionForIOS();
    FirebaseNotificationUtils().initfirebasesetting();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        FirebaseNotificationUtils().showNotification(message);
      }

      if (Platform.isIOS) {
        if (notification != null) {
          FirebaseNotificationUtils().flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                  // android: AndroidNotificationDetails(
                  //           channel.id,
                  //           channel.name,
                  //           channelDescript
                  //         ion: channel.description,
                  //           color: Colors.blue,
                  //           playSound: true,
                  //           icon: '@mipmap/ic_launcher',
                  //         ),

                  iOS: DarwinNotificationDetails()));
        }
      }
    });
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {
    String? onboardingScreen;
    await LocDb().isLoggedIn();
    bool check = LocDb().loginapp;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingScreen = preferences.getString(AppStringFile.onboardingScreen).toString();
     print("hjsfdgjhdsfg   ${check}");

    if (check) 
    {
      if (AppHelper.isLogin.toString() == "1") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.dashBoardScreenActivity, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
        // Navigator.pushNamed(context, Routes.addStudentInformation);
      }
    } else {
      if (onboardingScreen != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      } else 
      {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                AppImages.splash,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                  child: LoaderScreennew(),
                ),
                SizedBox(
                  height: 5.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
