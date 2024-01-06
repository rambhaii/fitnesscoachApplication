import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/EditTextWidget.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/components/UploadPicks.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddForm extends StatefulWidget {
  final Function callback;
  const AddForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final targetweightController = TextEditingController();
  final heightController = TextEditingController();
  final experinceController = TextEditingController();
  final availabiltyController = TextEditingController();
  final gymnameController = TextEditingController();
  final descriptionController = TextEditingController();

  final dobController = TextEditingController();
  final measureController = TextEditingController();
  final mealsPerDayController = TextEditingController();
  final allergiesController = TextEditingController();
  final diseaseController = TextEditingController();
  final activityController = TextEditingController();
  final securityNumberController = TextEditingController();
  final tagsController = TextEditingController();
  final checkInDaysController = TextEditingController();
  final startDateController = TextEditingController();
  final currentWeightController = TextEditingController();
  final currentbiceps = TextEditingController();
  final currentbutt = TextEditingController();
  final currentleg = TextEditingController();
  final currentwaist = TextEditingController();

  bool isShowLoading = false;
  bool _obscureText = true;
  String error = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  String gender = '';

  @override
  void dispose() {
    super.dispose();
    allergiesController.dispose();
    diseaseController.dispose();
    securityNumberController.dispose();
    tagsController.dispose();
    checkInDaysController.dispose();
    currentWeightController.dispose();
    activityController.dispose();
    startDateController.dispose();
    mealsPerDayController.dispose();
    measureController.dispose();
    targetweightController.dispose();
    heightController.dispose();
    experinceController.dispose();
    availabiltyController.dispose();
    gymnameController.dispose();
    descriptionController.dispose();
    dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Languages.of(context)!.currentWeight,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: currentWeightController,
                hinttext: Languages.of(context)!.enterYourCurrentWeight,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterYourCurrentWeight;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.tagetWeight,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: targetweightController,
                hinttext: Languages.of(context)!.entertargetWeight,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterTargetWeight;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.heightInCm,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: heightController,
                hinttext: Languages.of(context)!.enterYourHeight,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterHeight;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.experience,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: experinceController,
                hinttext: Languages.of(context)!.enterExperience,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterExperience;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.availabilityInWeek,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: availabiltyController,
                hinttext: Languages.of(context)!.enterDays,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterDays;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.gymName,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: gymnameController,
                hinttext: Languages.of(context)!.enterGymName,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterGymName;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.description,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: descriptionController,
                hinttext: Languages.of(context)!.enterYourdescription,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterYourDescription;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.gender,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        fillColor:
                            MaterialStatePropertyAll(AppColors.primarycolor),
                        value: Languages.of(context)!.male,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                      Text(
                        Languages.of(context)!.male,
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark
                            : AppStyle.cardtitle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        fillColor:
                            MaterialStatePropertyAll(AppColors.primarycolor),
                        value: Languages.of(context)!.female,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                      Text(
                        Languages.of(context)!.female,
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark
                            : AppStyle.cardtitle,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Radio(
                          fillColor:
                              MaterialStatePropertyAll(AppColors.primarycolor),
                          value: Languages.of(context)!.others,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text(
                          Languages.of(context)!.others,
                          style: AppHelper.themelight
                              ? AppStyle.cardtitledark
                              : AppStyle.cardtitle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Fill Current measurement in cm",
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              Row(
                children: [
                  Container(
                    width: 22.w,
                    child: EditTextWidget(
                      textEditingController: currentbiceps,
                      hinttext: Languages.of(context)!.biceps + ' cm',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return Languages.of(context)!.biceps;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                    width: 22.w,
                    child: EditTextWidget(
                      textEditingController: currentbutt,
                      hinttext: Languages.of(context)!.bum + ' cm',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return Languages.of(context)!.bum;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                    width: 20.w,
                    child: EditTextWidget(
                      textEditingController: currentleg,
                      hinttext: Languages.of(context)!.leg + ' cm',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return Languages.of(context)!.leg;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                    width: 20.w,
                    child: EditTextWidget(
                      textEditingController: currentwaist,
                      hinttext: Languages.of(context)!.waist + ' cm',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return Languages.of(context)!.waist;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),

              Text(
                Languages.of(context)!.measure,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: measureController,
                hinttext: Languages.of(context)!.enterYourMeasure,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterYourMeasure;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),

              Text(
                Languages.of(context)!.dob,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                obscure: false,
                suffixIcon: true,
                suffixIconWidget: IconButton(
                  onPressed: () async {
                    final date = await showDatePickerDialog(
                      disbaledCellColor: AppColors.primarycolorYellow,
                      enabledCellColor: AppColors.primarycolor,
                      leadingDateTextStyle:
                          TextStyle(color: AppColors.primarycolor),
                      selectedCellColor: AppColors.primarycolor,
                      daysNameTextStyle: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                      context: context,
                      initialDate: DateTime.now(),
                      minDate: DateTime(1900),
                      maxDate: DateTime.now(),
                    );
                    final day = date!.day.toString();
                    final month = date.month.toString();
                    final year = date.year.toString();
                    setState(() {
                      dobController.text = '$day-$month-$year';
                    });
                  },
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.primarycolor,
                  ),
                ),
                textEditingController: dobController,
                hinttext: Languages.of(context)!.enterYourDob,
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterYourDob;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.startDate,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                suffixIcon: true,
                obscure: false,
                suffixIconWidget: IconButton(
                  onPressed: () async {
                    final date = await showDatePickerDialog(
                      disbaledCellColor: AppColors.primarycolorYellow,
                      enabledCellColor: AppColors.primarycolor,
                      leadingDateTextStyle:
                          TextStyle(color: AppColors.primarycolor),
                      selectedCellColor: AppColors.primarycolor,
                      daysNameTextStyle: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                      context: context,
                      initialDate: DateTime.now(),
                      minDate: DateTime(2023),
                      maxDate: DateTime(2099),
                    );
                    final day = date!.day.toString();
                    final month = date.month.toString();
                    final year = date.year.toString();
                    setState(() {
                      startDateController.text = '$day-$month-$year';
                    });
                  },
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.primarycolor,
                  ),
                ),
                textEditingController: startDateController,
                hinttext: Languages.of(context)!.enterStartDate,
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterStartDate;
                  }
                  return null;
                },
              ),
              // SizedBox(
              //   height: 1.5.h,
              // ),
              // Text(
              //   Languages.of(context)!.checkInDays,
              //   style: AppHelper.themelight
              //       ? AppStyle.cardtitledark
              //       : AppStyle.cardtitle,
              // ),
              // EditTextWidget(
              //   textEditingController: checkInDaysController,
              //   hinttext: Languages.of(context)!.enterCheckInDays,
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value.toString().isEmpty) {
              //       return Languages.of(context)!.pleaseEnterCheckInDays;
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: 1.5.h,
              // ),
              // Text(
              //   Languages.of(context)!.tags,
              //   style: AppHelper.themelight
              //       ? AppStyle.cardtitledark
              //       : AppStyle.cardtitle,
              // ),
              // EditTextWidget(
              //   textEditingController: tagsController,
              //   hinttext: Languages.of(context)!.enterTags,
              //   keyboardType: TextInputType.text,
              //   validator: (value) {
              //     if (value.toString().isEmpty) {
              //       return Languages.of(context)!.pleaseEnterTags;
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.socialSecurityNumber,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: securityNumberController,
                hinttext: Languages.of(context)!.enterSocialSecurityNumber,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!
                        .pleaseEnterSocialSecurityNumber;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.activity,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: activityController,
                hinttext: Languages.of(context)!.enterActivity,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterActivity;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.disease,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: diseaseController,
                hinttext: Languages.of(context)!.disease,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterDisease;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                Languages.of(context)!.allergies,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                    : AppStyle.cardtitle,
              ),
              EditTextWidget(
                textEditingController: allergiesController,
                hinttext: Languages.of(context)!.enterAllergies,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return Languages.of(context)!.pleaseEnterAllergies;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // Text(
              //   Languages.of(context)!.mealsPerDay + ' gm',
              //   style: AppHelper.themelight
              //       ? AppStyle.cardtitledark
              //       : AppStyle.cardtitle,
              // ),
              // EditTextWidget(
              //   textEditingController: mealsPerDayController,
              //   hinttext: Languages.of(context)!.mealsPerDay,
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value.toString().isEmpty) {
              //       return Languages.of(context)!.pleaseEnterMealsPerDay;
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(
              //   height: 1.5.h,
              // ),
              // Text(
              //   Languages.of(context)!.measure,
              //   style: AppHelper.themelight
              //       ? AppStyle.cardtitledark
              //       : AppStyle.cardtitle,
              // ),
              // EditTextWidget(
              //   textEditingController: measureController,
              //   hinttext: Languages.of(context)!.enterYourMeasure,
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value.toString().isEmpty) {
              //       return Languages.of(context)!.pleaseEnterYourMeasure;
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(
                height: 1.5.h,
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
          ButtonWidget(
            text: Languages.of(context)!.next,
            onTap: () {
              adddata();
            },
          )
        ],
      ),
    );
  }

  adddata() async {
    setState(() {
      isLoading = true;
      widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => clickpicks(
                targetweight: targetweightController.text,
                weight: currentWeightController.text,
                htght: heightController.text,
                exercise: experinceController.text,
                availability: availabiltyController.text,
                gymName: gymnameController.text,
                description: descriptionController.text,
                gender: gender,
                dob: dobController.text,
                startDate: startDateController.text,
                checkInDays: checkInDaysController.text,
                tags: tagsController.text,
                socialSecurityNumber: securityNumberController.text,
                disease: diseaseController.text,
                allergies: allergiesController.text,
                mealsPerDay: mealsPerDayController.text,
                measure: measureController.text,
                activity: activityController.text,
                currentWeight: currentWeightController.text,
                biceps: currentbiceps.text,
                waist: currentwaist.text,
                butt: currentbutt.text,
                leg: currentleg.text),
          ),
        );
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
