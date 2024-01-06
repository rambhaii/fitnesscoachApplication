// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import '../../../api/apphelper.dart';
import '../../../localization/Language/languages.dart';
import '../../../utils/appColors.dart';
import '../../../utils/appbarforall.dart';
import '../../../utils/appstyle.dart';
import '../../../utils/dialoghelper.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      isLoading = true;
    });
    await sendData();
    setState(() {
      isLoading = false;
    });

    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }

  Future<void> sendData() async {
    final body = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneController.text.trim(),
      "message": messageController.text.trim(),
    };
    final response = await http
        .post(Uri.parse(APIURL.contactus), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE}',
    });
    var status = jsonDecode(response.body);
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   backgroundColor: AppColors.primarycolor,
      //   content: Text(
      //     textAlign: TextAlign.center,
      //     "Message sent successfully",
      //     style: TextStyle(
      //         color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      //   ),
      // ));
      DialogHelper.showFlutterToast(
          strMsg: "${Languages.of(context)!.messageSentSuccessfully}!");
      String data = response.body;
      print(data);
    } else {
      print('something went wrong');
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.contactus,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 2.h, left: 2.w, right: 2.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHelper.themelight
                  ? Image.asset(
                      AppImages.blacklogo,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      AppImages.logo,
                      fit: BoxFit.fill,
                    ),
              // Image.asset(
              //   AppImages.logo,
              //   height: 15.h,
              // ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Languages.of(context)!.contactus,
                        style: TextStyle(
                            color: AppColors.primarycolor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        Languages.of(context)!.contactusSubtitle,
                        style: TextStyle(
                            color: AppHelper.themelight
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormField(
                        validator: AppValidator.nameValidator,
                        style: TextStyle(
                            color: AppHelper.themelight
                                ? Colors.white
                                : Colors.black),
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        cursorColor: AppColors.primarycolor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.account_circle_rounded,
                            color: AppColors.primarycolor,
                          ),
                          hintText: Languages.of(context)!.name,
                          hintStyle: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                                  .copyWith(color: AppColors.greyColor)
                              : AppStyle.cardsubtitle
                                  .copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: AppHelper.themelight
                                ? Colors.white
                                : Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidator.emailValidator,
                        controller: emailController,
                        cursorColor: AppColors.primarycolor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: AppColors.primarycolor,
                          ),
                          hintText: Languages.of(context)!.email,
                          hintStyle: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                                  .copyWith(color: AppColors.greyColor)
                              : AppStyle.cardsubtitle
                                  .copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: AppHelper.themelight
                                ? Colors.white
                                : Colors.black),
                        keyboardType: TextInputType.phone,
                        validator: AppValidator.mobileValidator,
                        controller: phoneController,
                        cursorColor: AppColors.primarycolor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.call,
                            color: AppColors.primarycolor,
                          ),
                          hintText: Languages.of(context)!.mobile,
                          hintStyle: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                                  .copyWith(color: AppColors.greyColor)
                              : AppStyle.cardsubtitle
                                  .copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: AppHelper.themelight
                                ? Colors.white
                                : Colors.black),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Languages.of(context)!
                                .messageShouldNotBeEmpty;
                          }
                          return null;
                        },
                        controller: messageController,
                        maxLines: 4,
                        cursorColor: AppColors.primarycolor,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.w),
                            ),
                          ),
                          hintText: Languages.of(context)!.leaveUsMessage,
                          hintStyle: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                                  .copyWith(color: AppColors.greyColor)
                              : AppStyle.cardsubtitle
                                  .copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SubmitButton(
                        text: Languages.of(context)!.sendMessage,
                        onTap: _submit,
                      )
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
}
