import 'dart:io';

import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeinformationformtwo extends StatefulWidget {
  const Homeinformationformtwo({super.key});

  @override
  State<Homeinformationformtwo> createState() => _HomeinformationformtwoState();
}

class _HomeinformationformtwoState extends State<Homeinformationformtwo> {
  int id = 1;

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   Languages.of(context)!.weeklyPrevious,
                //   style: AppHelper.themelight
                //       ? AppStyle.cardtitledark
                //       : AppStyle.cardtitle,
                // ),
                // Divider(
                //   color: AppColors.primarycolor.withOpacity(0.4),
                //   thickness: 1,
                // ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context)!.previousweekQuestion,
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppHelper.themelight
                            ? AppColors.primarycolorYellow
                            : AppColors.primarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                        border:
                            Border.all(color: AppColors.primarycolor, width: 2),
                      ),
                      child: RadioListTile(
                        title: Text(
                          Languages.of(context)!.Good,
                          style:
                              AppStyle.cardtitle.copyWith(color: Colors.white),
                        ),
                        value: 1,
                        groupValue: id,
                        onChanged: (val) async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              AppStringFile.previousweekplan,
                              Languages.of(context)!.Good);
                          setState(() {
                            id = 1;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppHelper.themelight
                            ? AppColors.primarycolorYellow
                            : AppColors.primarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                        border:
                            Border.all(color: AppColors.primarycolor, width: 2),
                      ),
                      child: RadioListTile(
                        title: Text(
                          Languages.of(context)!.Okay,
                          // "Male",
                          style:
                              AppStyle.cardtitle.copyWith(color: Colors.white),
                        ),
                        value: 2,
                        groupValue: id,
                        onChanged: (val) async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              AppStringFile.previousweekplan,
                              Languages.of(context)!.Good);
                          setState(() {
                            id = 2;
                          });
                        },
                      ),
                    ),
                  
                  
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppHelper.themelight
                            ? AppColors.primarycolorYellow
                            : AppColors.primarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                        border:
                            Border.all(color: AppColors.primarycolor, width: 2),
                      ),
                      child: RadioListTile(
                        title: Text(
                          Languages.of(context)!.Lessgood,
                          // "Male",
                          style:
                              AppStyle.cardtitle.copyWith(color: Colors.white),
                        ),
                        value: 3,
                        groupValue: id,
                        onChanged: (val) async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              AppStringFile.previousweekplan,
                              Languages.of(context)!.Lessgood);
                          setState(() {
                            id = 3;
                          });
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: 1.h,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: AppHelper.themelight
                    //         ? AppColors.primarycolorYellow
                    //         : AppColors.primarycolor,
                    //     borderRadius: BorderRadius.all(Radius.circular(1.h)),
                    //     border:
                    //         Border.all(color: AppColors.primarycolor, width: 2),
                    //   ),
                    //   child: RadioListTile(
                    //     title: Text(
                    //       "Okej",
                    //       //"Male",
                    //       style:
                    //           AppStyle.cardtitle.copyWith(color: Colors.white),
                    //     ),
                    //     value: 4,
                    //     groupValue: id,
                    //     onChanged: (val) async {
                    //       SharedPreferences sharedPreferences =
                    //           await SharedPreferences.getInstance();
                    //       sharedPreferences.setString(
                    //           AppStringFile.previousweekplan, "Okej");
                    //       setState(() {
                    //         id = 4;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context)!.changes,
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                    ),
                    TextFormField(
                        keyboardType: Platform.isIOS
                            ? TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              )
                            : TextInputType.multiline,
                        minLines: 4,
                        maxLines: 4,
                        onChanged: (value) async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              AppStringFile.challengesovercome,
                              value.toString());
                        },
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark
                            : AppStyle.cardtitle,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).cardTheme.color,

                          // Colors.white,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.h),
                              borderSide:
                                  BorderSide(color: AppColors.blackColor)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Languages.of(context)!.follow,
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                    ),
                    TextFormField(
                        keyboardType: Platform.isIOS
                            ? TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              )
                            : TextInputType.multiline,
                        minLines: 4,
                        maxLines: 4,
                        onChanged: (value) async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString(
                              AppStringFile.didyourplan, value.toString());
                        },
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark
                            : AppStyle.cardtitle,
                        // maxLength: 1000,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              // borderSide:
                              //     BorderSide(color: AppColors.blackColor)
                              ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1.h),
                              borderSide:
                                  BorderSide(color: AppColors.blackColor)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
