import 'dart:io';

import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/informationform.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeInformationFormScreenActivity extends StatefulWidget {
  const HomeInformationFormScreenActivity({super.key});

  @override
  State<HomeInformationFormScreenActivity> createState() =>
      _HomeInformationFormScreenActivityState();
}

class _HomeInformationFormScreenActivityState
    extends State<HomeInformationFormScreenActivity> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController weightController = TextEditingController();
  TextEditingController bicepsController = TextEditingController();
  TextEditingController buttController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController legController = TextEditingController();
  TextEditingController averageNumberController = TextEditingController();

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;
  XFile? imagefiles1;
  XFile? imagefiles2;
  @override
  void initState() {
    super.initState();
    getAppData();
  }

  openImages(int value) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        if (value == 0) {
          imagefiles = image;
          print("dlkjgkfjhg1");
          sharedPreferences.setString(
              AppStringFile.imgfront, imagefiles!.path.toString());
          setState(() {});
        } else if (value == 1) {
          print("dlkjgkfjhg2");
          imagefiles1 = image;
          sharedPreferences.setString(
              AppStringFile.imgback, imagefiles1!.path.toString());
          setState(() {});
        } else {
          print("dlkjgkfjhg2");
          imagefiles2 = image;
          sharedPreferences.setString(
              AppStringFile.imgsid, imagefiles2!.path.toString());
          setState(() {});
        }
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  getAppData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getString(AppStringFile.weight) != null) 
    {
      print("fdkjhg");
      weightController.text =
          preferences.getString(AppStringFile.weight).toString();
      bicepsController.text =
          preferences.getString(AppStringFile.biceps).toString();
      buttController.text =
          preferences.getString(AppStringFile.butt).toString();
      waistController.text =
          preferences.getString(AppStringFile.waist).toString();
      legController.text = preferences.getString(AppStringFile.leg).toString();
      averageNumberController.text =
          preferences.getString(AppStringFile.stepsWeek).toString();
    }

    //  weightController.text = AppHelper.weight.toString();
    //  bicepsController .text= AppHelper.biceps.toString();
    //  buttController .text= AppHelper.butt.toString();
    //  waistController.text = AppHelper.waist.toString();
    //  legController.text = AppHelper.leg.toString();
    //  averageNumberController.text = AppHelper.averagenumbersteps.toString();
  }

  final FocusNode _nodeText1 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  onTap: () => FocusScope.of(context).unfocus(),
      //onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onTap: () {
        FocusScopeNode cf = FocusScope.of(context);
        if (!cf.hasPrimaryFocus && cf.focusedChild != null) {
          cf.focusedChild!.unfocus();
          cf.unfocus();
        }
      },
      child: Scaffold(
        //backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Languages.of(context)!.weight}*",
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                            InformationTextFormScreen(
                              focusNode: _nodeText1,
                              hinttext: Languages.of(context)!.weight,
                              icon: Icons.bubble_chart,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              textEditingController: weightController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.weight, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Languages.of(context)!.biceps}*",
                              // Languages.of(context)!.enterdescription,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                            InformationTextFormScreen(
                              hinttext: Languages.of(context)!.biceps,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              icon: Icons.bubble_chart,
                              textEditingController: bicepsController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.biceps, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Languages.of(context)!.bum}*",
                              // Languages.of(context)!.enterdescription,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                            InformationTextFormScreen(
                              hinttext: Languages.of(context)!.bum,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              icon: Icons.bubble_chart,
                              textEditingController: buttController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.butt, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Languages.of(context)!.waist}*",
                              // Languages.of(context)!.enterdescription,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                            InformationTextFormScreen(
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              hinttext: Languages.of(context)!.waist,
                              icon: Icons.bubble_chart,
                              textEditingController: waistController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.waist, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${Languages.of(context)!.leg}*",
                              // Languages.of(context)!.enterdescription,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                            InformationTextFormScreen(
                              hinttext: Languages.of(context)!.leg,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              icon: Icons.bubble_chart,
                              textEditingController: legController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.leg, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                "${Languages.of(context)!.steps}*",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                // Languages.of(context)!.enterdescription,

                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                    : AppStyle.cardtitle,
                              ),
                            ),
                            InformationTextFormScreen(
                              hinttext: Languages.of(context)!.steps,
                              icon: Icons.bubble_chart,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true, decimal: true)
                                  : TextInputType.number,
                              textEditingController: averageNumberController,
                              validator: AppValidator.lastnameValidator,
                              onChanged: (value) async {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    AppStringFile.stepsWeek, value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Divider(
                          color: AppColors.primarycolor.withOpacity(0.4),
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Languages.of(context)!.upLoadImg,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            openImages(0);
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                              color: Theme.of(context).cardTheme.color,
                              border: Border.all(
                                  color: AppColors.greyColor, width: 1),
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
                                                  image: FileImage(
                                                      File(imagefiles!.path)))
                                              : DecorationImage(
                                                  fit: BoxFit.fill,
                                                  colorFilter: ColorFilter.mode(
                                                      AppColors.greyColor
                                                          .withOpacity(0.10),
                                                      BlendMode.dstATop),
                                                  image: AssetImage(
                                                      AppImages.bodyfront)),
                                          borderRadius:
                                              BorderRadius.circular(1.w)),
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
                            openImages(1);
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                              color: Theme.of(context).cardTheme.color,
                              border: Border.all(
                                  color: AppColors.greyColor, width: 1),
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
                                                  image: FileImage(
                                                      File(imagefiles1!.path)))
                                              : DecorationImage(
                                                  fit: BoxFit.fill,
                                                  colorFilter: ColorFilter.mode(
                                                      AppColors.greyColor
                                                          .withOpacity(0.10),
                                                      BlendMode.dstATop),
                                                  image: AssetImage(
                                                      AppImages.bodyback)),
                                          borderRadius:
                                              BorderRadius.circular(1.w)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                              color: Theme.of(context).cardTheme.color,
                              border: Border.all(
                                  color: AppColors.greyColor, width: 1),
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
                                                  image: FileImage(
                                                      File(imagefiles2!.path)))
                                              : DecorationImage(
                                                  fit: BoxFit.fill,
                                                  colorFilter: ColorFilter.mode(
                                                      AppColors.greyColor
                                                          .withOpacity(0.10),
                                                      BlendMode.dstATop),

                                                  // invertColors: AppColors.greyColor.withOpacity(0.6),
                                                  image: AssetImage(
                                                      AppImages.bodyside)),
                                          borderRadius:
                                              BorderRadius.circular(1.w)),
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

                        // InfoContainerboxUI(
                        //   title: Languages.of(context)!.front,
                        //   subtitle: Languages.of(context)!.upload,
                        //   image: AppImages.bodyfront,
                        //   onTap: () {
                        //     openImages();
                        //   },
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // InfoContainerboxUI(
                        //   title: "Profil",
                        //   subtitle: "Tryck for att ladda upp bild",
                        //   image: AppImages.bodyside,
                        //   onTap: ()
                        //   {
                        //     openImages();
                        //   },
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        // InfoContainerboxUI(
                        //   title: "Baksida",
                        //   subtitle: "Tryck for att ladda upp bild",
                        //   image: AppImages.bodyback,
                        //   onTap: () {
                        //     openImages();
                        //   },
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
