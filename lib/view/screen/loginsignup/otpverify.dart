import 'dart:io';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerify extends StatefulWidget {
  final String? email;
  final String? userid;

  const OtpVerify({Key? key, this.email, this.userid}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool isLoading = false;
  String _finalotp = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SingleChildScrollView(
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
                text: Languages.of(context)!.verifyaccount,
                subtext: Languages.of(context)!.verifyaccountmsg,
              ),
              SizedBox(
                height: 6.h,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                cursorColor: AppColors.blackColor,
                //animationType: AnimationType.fade,

                pastedTextStyle: TextStyle(
                  color: AppColors.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  disabledColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(1.h),
                  fieldHeight: 100.w / 8,
                  fieldWidth: 100.w / 8,
                  activeFillColor: AppColors.primarycolor,
                  // Theme.of(context).colorScheme.primary,12

                  inactiveColor: AppColors.greyColor,
                  inactiveFillColor: AppColors.whiteColor,
                  selectedFillColor: AppColors.whiteColor,
                  selectedColor: AppColors.primarycolor,
                  activeColor: Theme.of(context).appBarTheme.backgroundColor,
                ),

                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  _finalotp = v;
                },
                onChanged: (value) {
                  print(value);
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Text(
                  _error,
                  style: AppStyle.cardsubtitle
                      .copyWith(color: Colors.red, fontSize: 15.sp),
                ),
              ),
              Center(
                child: Text(Languages.of(context)!.plzenterotpverify,
                    style: AppHelper.themelight
                        ? AppStyle.cardsubtitledark
                        : AppStyle.cardsubtitle),
              ),
              SizedBox(
                height: 6.h,
              ),
              ButtonWidget(
                onTap: () {
                  fetchdata();
                },
                text: Languages.of(context)!.submit,
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: Languages.of(context)!.otpnotrecive,
                    style: AppStyle.cardsubtitle.copyWith(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: Languages.of(context)!.resend,
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              forgotPassword();
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  forgotPassword() async {
    var data = {
      'email': widget.email.toString(),
    };

    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.sentotp();
    if (response['status'].toString() == "success") {
      // Navigator.pushNamed(context, Routes.otpVerify, arguments: {
      //   StringFile.email: email,
      //   StringFile.pagetype: StringFile.forgot_password,
      //   // StringFile.id: response['user']['id'],
      // });
      DialogHelper.showFlutterToast(strMsg: "success");
    } else {
      setState(() {
        _error = response['_error'].toString();
        isLoading = false;
      });
    }
  }

  Future<void> fetchdata() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_finalotp.isNotEmpty) {
        if (_finalotp.length == 6) {
          var data = {
            'email': widget.email,
            'otp': _finalotp,
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.verifyOtp();

          if (response['status'].toString().toLowerCase() == "success") {
            print("kdjhfgkj" +
                widget.email.toString() +
                "" +
                _finalotp.toString());
            Navigator.pushNamed(context, Routes.setnewPassword, arguments: {
              AppStringFile.email: widget.email,
              AppStringFile.otp: _finalotp,
            });
            DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.otpsendsuccessfully);
            setState(() {
              isLoading = false;
            });
          } else {
             DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.optVarificationFailure);
            setState(() {
              _error = response['error'];
            });
          }
        }
      } else {
        setState(() {
          isLoading = false;
        });
        DialogHelper.showFlutterToast(
            strMsg: Languages.of(context)!.fillThisfield);
      }
    } else {
      DialogHelper().shoppopDialog(context);
    }
  }
}
