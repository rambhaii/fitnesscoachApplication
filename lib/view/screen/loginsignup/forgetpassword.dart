import 'dart:io';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/components/forget_password_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Platform.isAndroid
                                ? Icons.arrow_back
                                : Icons.arrow_back_ios,
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                    MainBar(
                      text: Languages.of(context)!.forgotpassword,
                      subtext: Languages.of(context)!.forgotpasswordmsg,
                    ),
                    SafeArea(
                        child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ForgetPasswordForm(
                            callback: (value) {
                              if (value) {
                                setState(() {
                                  isLoading = true;
                                });
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text: Languages.of(context)!.rememberyourpassword,
                              style: AppHelper.themelight
                                  ? AppStyle.cardsubtitledark
                                  : AppStyle.cardsubtitle,
                              children: <TextSpan>[
                                TextSpan(
                                    text: Languages.of(context)!.login,
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark.copyWith(
                                            color: AppColors.primarycolor)
                                        : AppStyle.cardsubtitle.copyWith(
                                            color: AppColors.primarycolor),
                                    // style: Style_File.subtitle.copyWith(
                                    //     color: colorBlack, fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pushNamed(
                                          context, Routes.loginScreenActivity)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            if (isLoading)
              Container(
                height: 80.h,
                width: 100.w,
                color: Colors.transparent,
                child: LoaderScreen(),
              )
          ],
        ),
      ),
    );
  }
}
