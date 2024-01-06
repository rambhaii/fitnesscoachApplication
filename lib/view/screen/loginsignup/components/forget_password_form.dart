import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordForm extends StatefulWidget {
  final Function callback;
  const ForgetPasswordForm({
    super.key,
    required this.callback,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool _obscureText = true;
  String _error = '';

  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Languages.of(context)!.email,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark
                      : AppStyle.cardtitle),
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                child: TextFormScreen(
                  textEditingController: emailController,
                  hinttext: Languages.of(context)!.email,
                  icon: Icons.email,
                  validator: AppValidator.emailValidator,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(_error,
                    style: AppHelper.themelight
                        ? AppStyle.cardtitledark.copyWith(color: Colors.red)
                        : AppStyle.cardtitle.copyWith(color: Colors.red)),
              ),
              SizedBox(
                height: 2.h,
              ),
              ButtonWidget(
                text: Languages.of(context)!.submit,
                onTap: () {
                  setState(() {
                    _error = '';
                  });
                  if (isLoading) {
                    return;
                  }

                  forgotPassword(emailController.text);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  forgotPassword(String email) async {
    setState(() {
      isLoading = true;
      widget.callback(true);
    });
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {
          "email": emailController.text,
        };
        print(data);
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.sentotp();

        if (response['status'].toString().toLowerCase() == "success") {
          setState(() {
            isLoading = false;
            widget.callback(false);
          });
          Navigator.pushNamed(context, Routes.otpVerify, arguments: {
            AppStringFile.email: email,
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            _error = response['error'].toString();
            widget.callback(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
        widget.callback(false);
      });
    }
  }
}
