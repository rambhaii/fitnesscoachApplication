import 'dart:developer';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/localization/locale_constants.dart';
import 'package:alpersonalcoachingapp/model/language_model.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonlanguagechange.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<bool> checklanguage = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                AppImages.languagetrans,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            RichText(
              text: TextSpan(
                text: Languages.of(context)!.labelSelectLanguage,
                style: AppStyle.welcometext,
                children: <TextSpan>[
                  TextSpan(
                      text: Languages.of(context)!.labelChangeLanguage,
                      style: AppStyle.welcometextprimecolor),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      for (int i = 0;
                          i < LanguageModel.languageList().length;
                          i++)
                        InkWell(
                          onTap: () async {
                            for (int j = 0; j < checklanguage.length; j++) {
                              setState(() {
                                checklanguage[j] = false;
                              });
                            }

                            log(LanguageModel.languageList()[i].languageCode);
                            changeLanguage(context,
                                LanguageModel.languageList()[i].languageCode);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            String languageCode =
                                prefs.getString(prefSelectedLanguageCode) ??
                                    "en";
                            setState(() {
                              AppHelper.language =
                                  LanguageModel.languageList()[i].languageCode;
                            });

                            await prefs.setString(prefSelectedLanguageCode,
                                LanguageModel.languageList()[i].languageCode);
                            if (languageCode ==
                                LanguageModel.languageList()[i].languageCode) {
                              setState(() {
                                checklanguage[i] = true;
                              });
                            }

                            // Navigator.pushNamed(
                            //     context, Routes.welcomeScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Container(
                              width: 80.w,
                              height: 9.h,
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColorgrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.h)),
                                  // border: Border.all(
                                  //     color: AppColors.blackColor,
                                  //     width: 1),

                                  border: checklanguage[i]
                                      ? Border.all(
                                          color: AppColors.blackColor, width: 1)
                                      : Border.all(
                                          color: AppColors.primarycolor,
                                          width: 1)),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LanguageModel.languageList()[i].flag,
                                      style: AppStyle.onbaordtitle.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 16.sp),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.h,
                                              height: 2.h,
                                              child: Image(
                                                  image: AssetImage(
                                                      LanguageModel
                                                              .languageList()[i]
                                                          .flagImage)),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              LanguageModel.languageList()[i]
                                                  .name,
                                              style: AppStyle.onbaordtitle
                                                  .copyWith(
                                                      color: AppColors
                                                          .primarycolor,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        if (checklanguage[i])
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primarycolor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.h)),
                                              border: Border.all(
                                                  color: AppColors.primarycolor,
                                                  width: 1),
                                            ),
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.black,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
            SizedBox(
              width: 65.w,
              child: ButtonWidgetLanguageChanage(
                  text: Languages.of(context)!.continues,
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.welcomeScreen);
                  }),
            )
          ],
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.h),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h),
        child: DropdownButton<LanguageModel>(
          iconSize: 30,
          underline: SizedBox(),
          hint: Text(Languages.of(context)!.labelSelectLanguage),
          onChanged: (LanguageModel? language) {
            changeLanguage(context, language!.languageCode);
          },
          items: LanguageModel.languageList()
              .map<DropdownMenuItem<LanguageModel>>(
                (e) => DropdownMenuItem<LanguageModel>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
