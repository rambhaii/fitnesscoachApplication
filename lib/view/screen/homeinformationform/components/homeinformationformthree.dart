import 'dart:io';

import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformwidgetui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeinformationformthree extends StatefulWidget {
  const Homeinformationformthree({super.key});

  @override
  State<Homeinformationformthree> createState() =>
      _HomeinformationformthreeState();
}

class _HomeinformationformthreeState extends State<Homeinformationformthree> {
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Languages.of(context)!.upcommingFirst,
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark
                              : AppStyle.cardtitle,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppHelper.themelight
                                ? AppColors.primarycolorYellow
                                : AppColors.primarycolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                            border: Border.all(
                                color: AppColors.primarycolor, width: 2),
                          ),
                          child: RadioListTile(
                            title: Text(
                              Languages.of(context)!.upcommingFirstan,
                              style: AppStyle.cardtitle
                                  .copyWith(color: Colors.white),
                            ),
                            value: 1,
                            groupValue: id,
                            onChanged: (val) async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.comingweekanswer,
                                  Languages.of(context)!.upcommingFirstan);

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
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                            border: Border.all(
                                color: AppColors.primarycolor, width: 2),
                          ),
                          child: RadioListTile(
                            title: Text(
                              Languages.of(context)!.upcommingsecond,
                              // "Male",
                              style: AppStyle.cardtitle
                                  .copyWith(color: Colors.white),
                            ),
                            value: 2,
                            groupValue: id,
                            onChanged: (val) async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.comingweeksecondanswer,
                                  Languages.of(context)!.upcommingsecond);

                              setState(() {
                                id = 2;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),

                        // HomeinformationformUiScreenACtivity(
                        //   callback: (value) async {
                        //     SharedPreferences sharedPreferences =
                        //         await SharedPreferences.getInstance();
                        //     sharedPreferences.setString(
                        //         AppStringFile.comingweekanswer,
                        //         Languages.of(context)!.upcommingFirstan);
                        //     setState(() {});
                        //   },
                        //   title: Languages.of(context)!.upcommingFirstan,
                        //   color: AppHelper.themelight
                        //       ? AppColors.primarycolorYellow
                        //       : AppColors.primarycolor,
                        // ),
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        // HomeinformationformUiScreenACtivity(
                        //   callback: (value) async {
                        //     SharedPreferences sharedPreferences =
                        //         await SharedPreferences.getInstance();
                        //     sharedPreferences.setString(
                        //         AppStringFile.comingweeksecondanswer,
                        //         Languages.of(context)!.upcommingsecond);
                        //     setState(() {});
                        //   },
                        //   title: Languages.of(context)!.upcommingsecond,
                        //   color: AppHelper.themelight
                        //       ? AppColors.primarycolorYellow
                        //       : AppColors.primarycolor,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Languages.of(context)!.whatdays,
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark
                              : AppStyle.cardtitle,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(AppStringFile.sunday,
                                  Languages.of(context)!.monday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.sunday, "");
                            }

                            setState(() {});
                          },
                          title: Languages.of(context)!.monday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(AppStringFile.monday,
                                  Languages.of(context)!.tuesday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.monday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.tuesday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(AppStringFile.tuesday,
                                  Languages.of(context)!.wednesday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.tuesday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.wednesday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.wednesday,
                                  Languages.of(context)!.thursday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.wednesday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.thursday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.thursday,
                                  Languages.of(context)!.friday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.thursday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.friday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(AppStringFile.friday,
                                  Languages.of(context)!.saturday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.friday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.saturday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        HomeinformationformUiScreenACtivity(
                          callback: (value) async {
                            if (value) {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.saturday,
                                  Languages.of(context)!.sunday);
                            } else {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString(
                                  AppStringFile.saturday, "");
                            }
                            setState(() {});
                          },
                          title: Languages.of(context)!.sunday,
                          color: AppHelper.themelight
                              ? AppColors.primarycolorYellow
                              : AppColors.primarycolor,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          Languages.of(context)!.prevoiusweekchalange,
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark
                              : AppStyle.cardtitle,
                        ),
                        SizedBox(
                          height: 1.h,
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
                                  AppStringFile.lastQuestionAns, value);
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
                                borderSide:
                                    BorderSide(color: AppColors.greyColor),
                              ),
                            ))
                      ],
                    ),
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
