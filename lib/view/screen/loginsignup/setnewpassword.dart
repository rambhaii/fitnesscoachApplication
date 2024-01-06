import 'dart:io';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetnewPassword extends StatefulWidget {
  final String? otp;
  final String? email;
  const SetnewPassword({Key? key, this.email, this.otp}) : super(key: key);

  @override
  State<SetnewPassword> createState() => _SetnewPasswordState();
}

class _SetnewPasswordState extends State<SetnewPassword> {
  final _formKey = GlobalKey<FormState>();

  late ScaffoldMessengerState scaffoldMessenger;

  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  String error = '';

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();

  bool isShowLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: Languages.of(context)!.changenewpassword,
                    subtext: Languages.of(context)!.changenewpassword,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextFormScreen(
                                        textEditingController:
                                            newpasswordController,
                                        hinttext:
                                            Languages.of(context)!.newpassword,
                                        suffixIcon: true,
                                        icon: Icons.lock,
                                        obscure: _obscureText,
                                        onPressed: _toggle,
                                        validator:
                                            AppValidator.passwordValidator,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextFormScreen(
                                        textEditingController:
                                            confirmnewpasswordController,
                                        hinttext: Languages.of(context)!
                                            .confirmnewpassword,
                                        suffixIcon: true,
                                        icon: Icons.lock,
                                        obscure: _obscureText1,
                                        onPressed: _toggle1,
                                        validator: AppValidator
                                            .confirm_passwordValidator,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Center(
                                        child: Text(
                                          error,
                                          style: AppStyle.cardtitledark
                                              .copyWith(color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      ButtonWidget(
                                        text: Languages.of(context)!.submit,
                                        onTap: () {
                                          setState(() {
                                            error = '';
                                          });
                                          if (isLoading) {
                                            return;
                                          }

                                          resetPassword(
                                              newpasswordController.text,
                                              confirmnewpasswordController
                                                  .text);
                                        },
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  resetPassword(String newpassword, String confirmpassword) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          var data = {
            'otp': widget.otp.toString().trim(),
            'newPassword': newpassword.toString().trim(),
            'email': widget.email.toString().trim(),
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.forgetpassword();
          print(response);
          setState(() {
            isLoading = false;
          });
          if (response['status'].toString() == 'success') {
            setState(() {
              isLoading = false;
            });

            DialogHelper.showFlutterToast(
                strMsg:
                    Languages.of(context)!.confirmpasswordandpasswordnotmatch);
            Navigator.pushReplacementNamed(context, Routes.loginScreenActivity);
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString();

              isLoading = false;
            });
          }
        } else {
          setState(() {
            error = Languages.of(context)!.confirmpasswordmustbematch;
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.confirmpasswordmustbematch);
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
      });
    }
  }
}
