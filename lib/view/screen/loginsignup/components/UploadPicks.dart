// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/components/ButtonWidgetLoader.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class clickpicks extends StatefulWidget {
  final String targetweight;
  final String weight;
  final String htght;
  final String exercise;
  final String availability;
  final String gymName;
  final String description;

  final String gender;
  final String dob;
  final String startDate;
  final String checkInDays;
  final String tags;
  final String socialSecurityNumber;
  final String disease;
  final String allergies;
  final String mealsPerDay;
  final String measure;
  final String activity;
  final String currentWeight;
  final String biceps;
  final String waist;
  final String butt;
  final String leg;

  const clickpicks(
      {super.key,
      required this.targetweight,
      required this.weight,
      required this.htght,
      required this.exercise,
      required this.availability,
      required this.gymName,
      required this.description,
      required this.gender,
      required this.dob,
      required this.startDate,
      required this.checkInDays,
      required this.tags,
      required this.socialSecurityNumber,
      required this.disease,
      required this.allergies,
      required this.mealsPerDay,
      required this.measure,
      required this.activity,
      required this.currentWeight,
      required this.biceps,
      required this.waist,
      required this.butt,
      required this.leg});

  @override
  State<clickpicks> createState() => _clickpicks();
}

class _clickpicks extends State<clickpicks> {
  bool isShowLoading = false;
  bool _obscureText = true;
  String error = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;
  XFile? imagefiles1;
  XFile? imagefiles2;

  openImages(int value) async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        if (value == 0) {
          imagefiles = image;
          setState(() {});
        } else if (value == 1) {
          imagefiles1 = image;
          setState(() {});
        } else {
          imagefiles2 = image;
          setState(() {});
        }
      } else {
        DialogHelper.showFlutterToast(
            strMsg: Languages.of(context)!.imageNotSelected);
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.upLoadImg,
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  openImages(0);
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1.h)),
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(color: AppColors.greyColor, width: 1),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColorgrey
                                    .withOpacity(0.2),
                                image: imagefiles != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            FileImage(File(imagefiles!.path)))
                                    : DecorationImage(
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            AppColors.greyColor
                                                .withOpacity(0.6),
                                            BlendMode.dstATop),
                                        image: AssetImage(AppImages.bodyfront)),
                                borderRadius: BorderRadius.circular(1.w)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Languages.of(context)!.front,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitle
                                : AppStyle.cardsubtitle,
                          ),
                          Text(
                            Languages.of(context)!.upload,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                : AppStyle.cardtitledark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  openImages(1);
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1.h)),
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(color: AppColors.greyColor, width: 1),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColorgrey
                                    .withOpacity(0.2),
                                image: imagefiles1 != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            FileImage(File(imagefiles1!.path)))
                                    : DecorationImage(
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            AppColors.greyColor
                                                .withOpacity(0.6),
                                            BlendMode.dstATop),
                                        image: AssetImage(AppImages.bodyback)),
                                borderRadius: BorderRadius.circular(1.w)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Languages.of(context)!.back,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardsubtitle,
                          ),
                          Text(
                            Languages.of(context)!.upload,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                : AppStyle.cardtitledark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  openImages(2);
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1.h)),
                    color: Theme.of(context).cardTheme.color,
                    border: Border.all(color: AppColors.greyColor, width: 1),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColorgrey
                                    .withOpacity(0.2),
                                image: imagefiles2 != null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            FileImage(File(imagefiles2!.path)))
                                    : DecorationImage(
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            AppColors.greyColor
                                                .withOpacity(0.6),
                                            BlendMode.dstATop),

                                        // invertColors: AppColors.greyColor.withOpacity(0.6),
                                        image: AssetImage(AppImages.bodyside)),
                                borderRadius: BorderRadius.circular(1.w)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Languages.of(context)!.side,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardsubtitle,
                          ),
                          Text(
                            Languages.of(context)!.upload,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                : AppStyle.cardtitledark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              !isLoading
                  ? ButtonWidget(
                      text: Languages.of(context)!.upLoadImg,
                      onTap: () {
                        if (imagefiles == null) {
                          AppHelper().dialogBuilder(context, "",
                              Languages.of(context)!.uploadFrontImage);
                        } else if (imagefiles1 == null) {
                          AppHelper().dialogBuilder(context, "",
                              Languages.of(context)!.uploadBackImage);
                        } else if (imagefiles2 == null) {
                          AppHelper().dialogBuilder(context, "",
                              Languages.of(context)!.uploadSideImage);
                        } else {
                          updateUserDetails();
                        }
                      },
                    )
                  : ButtonWidgetLoader(),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future updateUserDetails() async {
    setState(() {
      isLoading = true;
    });
    if (imagefiles != null) {
      var url = Uri.parse(APIURL.addInformation);

      final request = http.MultipartRequest('POST', url);

      Map<String, String> headers = {
        "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}'
      };

      request.headers.addAll(headers);

      final file1 =
          await http.MultipartFile.fromPath('clientImage1', imagefiles!.path);
      final file2 =
          await http.MultipartFile.fromPath('clientImage2', imagefiles1!.path);
      final file3 =
          await http.MultipartFile.fromPath('clientImage3', imagefiles2!.path);

      request.files.add(file1);
      request.files.add(file2);
      request.files.add(file3);
      request.fields['userId'] = AppHelper.userid!;
      request.fields['targetWeight'] = widget.targetweight;
      request.fields['startingWeight'] = widget.currentWeight;
      request.fields['length'] = widget.htght;
      request.fields['experience'] = widget.exercise;
      request.fields['trainingDaysPerWeek'] = widget.availability;
      request.fields['trainingPlace'] = widget.gymName;
      request.fields['note'] = widget.description;

      //extra fields
      request.fields['activity'] = widget.activity;
      request.fields['disease'] = widget.disease;
      request.fields['measure'] = widget.measure;
      request.fields['allergy'] = widget.allergies;
      request.fields['mealPerDay'] = widget.mealsPerDay;
      request.fields['currentWeight'] = widget.currentWeight;
      request.fields['gender'] = widget.gender;
      request.fields['dob'] = widget.dob;
      request.fields['startDate'] = widget.startDate;
      request.fields['checkInDays'] = widget.checkInDays;
      request.fields['tags'] = widget.tags;
      request.fields['socialSecurityNumber'] = widget.socialSecurityNumber;
      request.fields['biceps'] = widget.biceps;
      request.fields['butt'] = widget.butt;
      request.fields['waist'] = widget.waist;
      request.fields['thighs'] = widget.leg;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        
        var out = jsonDecode(response.body);
        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.informationAddedSuccessfully);

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashBoardScreenActivity,
            (Route<dynamic> route) => false,
          );

          setState(()
           {
            isLoading = false;
          });
        }
      } catch (e) {
        print(e);
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
