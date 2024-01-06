// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatefulWidget {
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;
  const ChangePassword(
      {Key? key, this.id, this.password, this.pagetype, this.userid})
      : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  late ScaffoldMessengerState scaffoldMessenger;
  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  String error = '';
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();
  bool isShowLoading = false;
  bool isShowConfetti = false;

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
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Stack(
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
                    text: Languages.of(context)!.changepassword,
                    subtext: Languages.of(context)!.changenewpassword,
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                            currentpasswordController,
                                        hinttext: Languages.of(context)!
                                            .currentpassword,
                                        // suffixIcon: true,
                                        icon: Icons.password,
                                        // obscure: _obscureText1,
                                        // onPressed: _toggle1,

                                        validator: AppValidator
                                            .currentpasswordValidator,
                                      ),
                                      SizedBox(
                                        height: 2.h,
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
                                        //"Confirm New Password",
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
                                        text: Languages.of(context)!
                                            .changepassword,
                                        onTap: () {
                                          setState(() {
                                            error = '';
                                          });
                                          if (isLoading) {
                                            return;
                                          }

                                          changePassword(
                                              currentpasswordController.text,
                                              newpasswordController.text,
                                              confirmnewpasswordController
                                                  .text);
                                        },
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
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

  changePassword(String currentpassword, String newpassword,
      String confirmnewpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          if (currentpasswordController.text != newpasswordController.text) {
            var data = {
              //'id': widget.id,
              'currentPassword': currentpassword.toString().trim(),
              'newPassword': newpassword.toString().trim(),
              'confirmnewpassword': confirmnewpassword.toString().trim()

              // 'email': widget.email,
            };

            LoginApi registerresponse = LoginApi(data);
            var response = await registerresponse.changepassword();
            print(response);
            setState(() {
              isLoading = false;
            });

            if (response['status'].toString() == 'success') {
              setState(() {
                isLoading = false;
              });

              DialogHelper.showFlutterToast(
                  strMsg: Languages.of(context)!.passwordUpdated);
              // Navigator.pushReplacementNamed(context, Routes.loginScreen);

              Navigator.pop(context);
            } else {
              DialogHelper.showFlutterToast(
                  strMsg: Languages.of(context)!.currentPasswordIncorrect);
            }
          } else {
            setState(() {
              error = Languages.of(context)!.currentandNewPasswordNotSame;
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.currentandNewPasswordNotSame);
          }
        } else {
          setState(() {
            error = Languages.of(context)!.currentandNewPasswordNotSame;
            isLoading = false;
          });
          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.currentandNewPasswordNotSame);
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() 
      {
        isLoading = false;
      });

      DialogHelper().shoppopDialog(context);
    }
  }
}
