import 'dart:developer';
import 'dart:io';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:alpersonalcoachingapp/utils/showExitPopup.dart';
import 'package:alpersonalcoachingapp/view/Chat/SocketService.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/components/sign_in_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  bool isloading = false;

  // Future signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   print("googleAuth $googleAuth");
  //   log(googleAuth!.idToken.toString());

  //   googlelogin(googleAuth.idToken.toString());
  // }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    log("lang ${AppHelper.language}");
    super.initState();
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final AccessToken accessToken = loginResult.accessToken!;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // googlelogin(String token) async {
  //   var data = {
  //     'token': token,
  //   };
  //   LoginApi registerresponse = LoginApi(data);
  //   final response = await registerresponse.googlesocialmedialogin();
  //   if (response['status'] == 'true') {
  //     Map<String, dynamic> res = response['user'];
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     AppHelper.userid = res['id'].toString();
  //     AppHelper.email_VALUE = res['email'].toString();
  //     AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
  //     sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
  //     sharedPreferences.setString(AppStringFile.email, res['email'].toString());
  //     sharedPreferences.setString(
  //         AppStringFile.authtoken, response['accessToken'].toString());
  //     String? token;
  //     try {
  //       token = (await FirebaseMessaging.instance.getToken())!;
  //       print(token);
  //     } catch (e) {
  //       print(e);
  //     }
  //     var body = {"facId": token};
  //     LoginApi responsefcmtoken = LoginApi(body);
  //     final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
  //     print(responsefcmtokenreturn);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, Routes.dashBoardScreenActivity, (route) => false);
  //     DialogHelper.showFlutterToast(strMsg: "Login Successful");
  //   }
  // }

  // facebooklogin(String token) async {
  //   var data = {
  //     'token': token,
  //   };
  //   print(data.toString());
  //   LoginApi registerresponse = LoginApi(data);
  //   final response = await registerresponse.facebooksocialmedialogin();
  //   if (response['status'] == 'success') {
  //     Map<String, dynamic> res = response['user'];
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     AppHelper.userid = res['id'].toString();
  //     AppHelper.email_VALUE = res['email'].toString();
  //     AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
  //     sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
  //     sharedPreferences.setString(AppStringFile.email, res['email'].toString());
  //     sharedPreferences.setString(
  //         AppStringFile.authtoken, response['accessToken'].toString());
  //     String? token;
  //     try {
  //       token = (await FirebaseMessaging.instance.getToken())!;
  //       print(token);
  //     } catch (e) {
  //       print(e);
  //     }
  //     var body = {"facId": token};
  //     LoginApi responsefcmtoken = LoginApi(body);
  //     final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
  //     print(responsefcmtokenreturn);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, Routes.dashBoardScreenActivity, (route) => false);
  //     DialogHelper.showFlutterToast(strMsg: "Login Successful");
  //   }
  // }

  // applelogin(String token) async {
  //   var data = {
  //     'token': token,
  //   };
  //   LoginApi registerresponse = LoginApi(data);
  //   final response = await registerresponse.appleocialmedialogin();
  //   if (response['status'] == 'success') {
  //     Map<String, dynamic> res = response['user'];
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     AppHelper.userid = res['id'].toString();
  //     AppHelper.email_VALUE = res['email'].toString();
  //     AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
  //     sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
  //     sharedPreferences.setString(AppStringFile.email, res['email'].toString());
  //     sharedPreferences.setString(
  //         AppStringFile.authtoken, response['accessToken'].toString());

  //     String? token;
  //     try {
  //       token = (await FirebaseMessaging.instance.getToken())!;
  //       print(token);
  //     } catch (e) {
  //       print(e);
  //     }
  //     var body = {"facId": token};
  //     LoginApi responsefcmtoken = LoginApi(body);
  //     final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
  //     print(responsefcmtokenreturn);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, Routes.dashBoardScreenActivity, (route) => false);
  //     DialogHelper.showFlutterToast(strMsg: "Login Successful");
  //   }
  // }

  bool isLoadingpop = false;

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
                          if (AppHelper.logOutButton.toString() == "1") {
                           
                            Navigator.pushNamed(
                                context, Routes.onboardingScreen);
                         
                          } else {
                            Navigator.pop(context);
                          }
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
                    text: Languages.of(context)!.welcomelogintitlemsg,
                    subtext: Languages.of(context)!.welcomeloginsubtitlemsg,
                  ),
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInForm(
                          callback: (value) {
                            if (value) {
                              setState(() 
                              {
                                //isloading = true;
                              });
                            } else {
                              setState(() {
                                //  isloading = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                     
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          if (isloading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreen()),
            )
        ],
      ),
    );
  }
}
