import 'dart:async';

import 'package:alpersonalcoachingapp/api/UpdateSetApi.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';

import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/SetLists.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class VideoPlayer extends StatefulWidget {
  final String title;
  final ExerciseDayList exerciseDayList;
  const VideoPlayer(
      {super.key, required this.title, required this.exerciseDayList});

  @override
  State<VideoPlayer> createState() => _VideoPlayer();
}

class _VideoPlayer extends State<VideoPlayer> {
  bool showloginpop = false;
  bool showsendQuery = false;

  TextEditingController commentControlletr = TextEditingController();

  late List<TextEditingController> repsControlletr;
  late List<TextEditingController> weightControlletr;
  String url = "";
  int secondsRemaining = 0;
  bool enableResend = false;
  Timer? timer;

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // repsControlletr = List<TextEditingController>.generate(
    //     widget.exerciseDayList.setList!.length,
    //     (index) => TextEditingController(
    //         text: widget.exerciseDayList.setList![index].repsNo.toString()));

    // weightControlletr = List<TextEditingController>.generate(
    //     widget.exerciseDayList.setList!.length,
    //     (index) => TextEditingController(
    //         text: widget.exerciseDayList.setList![index].weight.toString()));
    // url = widget.exerciseDayList.exerciseDetail!.video.toString();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          //DialogHelper.showFlutterToast(strMsg: "Your Timing Stop!");
        });
      }
    });
  }

  Future adddata() async {
    List<SetLists> setList = [];
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (widget.exerciseDayList.exerciseDayId != null) {
        if (repsControlletr.isNotEmpty) {
          for (int i = 0; i < widget.exerciseDayList.setList!.length; i++) {
            setList.add(SetLists(
                id: widget.exerciseDayList.setList![i].id,
                repsNo: repsControlletr[i].text.toString().trim(),
                weight: weightControlletr[i].text.toString().trim()));
          }

          Map<String, dynamic> data = {
            "exerciseDayId": widget.exerciseDayList.exerciseDayId,
            "setList": setList,
          };

          print(data);

          UpdateSetApi responsedata = UpdateSetApi(data);
          final response = await responsedata
              .updateSetValue(widget.exerciseDayList.id.toString());

          if (response['status'] == "success") {
            commentControlletr.clear();
            DialogHelper.showFlutterToast(
                strMsg: "Value successfully updated now !");
          } else {
            DialogHelper.showFlutterToast(strMsg: "Something went wrong !");
          }
        } else {
          AppHelper().dialogBuilder(context, "", "exerciseDayId is null");
        }
      } else {
        AppHelper().dialogBuilder(context, "", "exerciseDayId is null");
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: SubmitButton(
      //   text: "Update Now",
      //   onTap: () {
      //     adddata();
      //   },
      // ),
      body: Column(
        children: [
          // Expanded(
          //   flex: 3,
          //   child: WatchVideo(
          //     url: url,
          //   ),
          // ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.title,
                                  style: AppHelper.themelight
                                      ? AppStyle.onbaordtitle
                                      : AppStyle.welcometext,
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 2,
                                ),
                                secondsRemaining != 0
                                    ? Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(width: 1)),
                                        child: Text(
                                          ' $secondsRemaining',
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark
                                              : AppStyle.cardsubtitle,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Row(children: [
                              Image(
                                image: AssetImage("assets/images/fitnes.png"),
                                width: 15,
                                height: 20,
                                color: AppHelper.themelight
                                    ? AppColors.whiteColor
                                    : AppColors.primarycolor,
                              ),
                              Text(
                                "  " +
                                    widget.exerciseDayList.setList!.length
                                        .toString() +
                                    " " +
                                    Languages.of(context)!.totalExcercise,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      widget.exerciseDayList.setList!.isNotEmpty
                          ? tarining()
                          : Center(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kommentar",
                              style: AppHelper.themelight
                                  ? AppStyle.cardsubtitledark
                                  : AppStyle.cardsubtitle,
                            ),
                            TextFormField(
                                controller: commentControlletr,
                                onChanged: (value) {
                                  commentControlletr.text = value;
                                },
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 10,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                                // maxLength: 1000,
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).cardTheme.color,
                                  hintText: "Skriv kommentar....",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1.h),
                                      borderSide: BorderSide(
                                          color: AppColors.blackColor)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greyColor),
                                  ),
                                )),
                            SubmitButton(
                              text: "Update Now",
                              onTap: () {
                                adddata();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget tarining() {
  //   return Padding(
  //     padding: EdgeInsets.all(0),
  //     child:
  //     ListView.builder(
  //       physics: NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: widget.exerciseDayList.setList!.length,
  //       itemBuilder: (context, index) {
  //         final data = widget.exerciseDayList.setList![index];
  //         return Container(
  //             child: Card(
  //           child: Padding(
  //               padding: const EdgeInsets.only(
  //                   left: 10.0, right: 15, top: 5, bottom: 5),
  //               child: Row(
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         width: 45.w,
  //                         child: Text(
  //                           data.setName.toString() ?? '',
  //                           style: AppHelper.themelight
  //                               ? AppStyle.cardsubtitledark
  //                               : AppStyle.cardsubtitle,
  //                         ),
  //                       ),
  //                       Text(
  //                         data.repsDetail?.repsName.toString() ?? '',
  //                         style: AppHelper.themelight
  //                             ? AppStyle.cardsubtitledark
  //                             : AppStyle.cardsubtitle,
  //                       ),
  //                     ],
  //                   ),
  //                   Spacer(),
  //                   IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           secondsRemaining = int.parse(data.restTime!.isEmpty
  //                               ? "60"
  //                               : data.restTime.toString());
  //                           startTimer();
  //                         });
  //                       },
  //                       icon: Icon(Icons.play_arrow)),
  //                   Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Column(
  //                             children: [
  //                               Text(
  //                                 "Reps",
  //                                 style: AppHelper.themelight
  //                                     ? AppStyle.cardsubtitledark
  //                                     : AppStyle.cardsubtitle,
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   Container(
  //                                     height: 4.h,
  //                                     width: 10.w,
  //                                     child: Center(
  //                                       child: TextField(
  //                                         controller: repsControlletr[index],
  //                                         textAlign: TextAlign.center,
  //                                         keyboardType: TextInputType.number,
  //                                         onChanged: (value) {
  //                                           repsControlletr[index].text = value;
  //                                         },
  //                                         style: AppStyle.cardsubtitle.copyWith(
  //                                           color: AppHelper.themelight
  //                                               ? AppColors.primarycolorYellow
  //                                               : AppColors.primarycolor,
  //                                           fontSize: 16.sp,
  //                                         ),
  //                                         decoration: InputDecoration(
  //                                           contentPadding:
  //                                               EdgeInsets.symmetric(
  //                                             vertical: 0.h,
  //                                           ),
  //                                           hintText: "00",
  //                                           border: OutlineInputBorder(),
  //                                           focusedBorder: OutlineInputBorder(),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               )
  //                             ],
  //                           ),
  //                           SizedBox(
  //                             width: 3.w,
  //                           ),
  //                           Column(
  //                             children: [
  //                               Text(
  //                                 "Weight",
  //                                 style: AppHelper.themelight
  //                                     ? AppStyle.cardsubtitledark
  //                                     : AppStyle.cardsubtitle,
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   Container(
  //                                     height: 4.h,
  //                                     width: 10.w,
  //                                     child: Center(
  //                                       child: TextField(
  //                                         controller: weightControlletr[index],
  //                                         textAlign: TextAlign.center,
  //                                         keyboardType: TextInputType.number,
  //                                         onChanged: (value) {
  //                                           weightControlletr[index].text =
  //                                               value;
  //                                         },
  //                                         style: AppStyle.cardsubtitle.copyWith(
  //                                           color: AppHelper.themelight
  //                                               ? AppColors.primarycolorYellow
  //                                               : AppColors.primarycolor,
  //                                           fontSize: 16.sp,
  //                                         ),
  //                                         decoration: InputDecoration(
  //                                           contentPadding:
  //                                               EdgeInsets.symmetric(
  //                                             vertical: 0.h,
  //                                           ),
  //                                           hintText: "00",
  //                                           border: OutlineInputBorder(),
  //                                           focusedBorder: OutlineInputBorder(),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               )
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               )),
  //         ));
  //       },
  //     ),

  //   );
  // }

  Widget tarining() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.exerciseDayList.setList!.length,
        itemBuilder: (context, index) {
          final data = widget.exerciseDayList.setList![index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 15, top: 5, bottom: 5),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Text(
                          data.setName.toString(),
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                        ),
                      ),
                      Text(
                        data.repsDetail?.repsName.toString() ?? '',
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark
                            : AppStyle.cardsubtitle,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          secondsRemaining = int.parse(data.restTime!.isEmpty
                              ? "60"
                              : data.restTime.toString());
                          startTimer();
                        });
                      },
                      icon: Icon(Icons.play_arrow)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Reps",
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                    width: 10.w,
                                    child: Center(
                                      child: TextField(
                                        controller: repsControlletr[index],
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          repsControlletr[index].text = value;
                                        },
                                        style: AppStyle.cardsubtitle.copyWith(
                                          color: AppHelper.themelight
                                              ? AppColors.primarycolorYellow
                                              : AppColors.primarycolor,
                                          fontSize: 16.sp,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.h,
                                          ),
                                          hintText: "00",
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            children: [
                              Text(
                                "Weight",
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                    width: 10.w,
                                    child: Center(
                                      child: TextField(
                                        controller: weightControlletr[index],
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          weightControlletr[index].text = value;
                                        },
                                        style: AppStyle.cardsubtitle.copyWith(
                                          color: AppHelper.themelight
                                              ? AppColors.primarycolorYellow
                                              : AppColors.primarycolor,
                                          fontSize: 16.sp,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0.h,
                                          ),
                                          hintText: "00",
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
