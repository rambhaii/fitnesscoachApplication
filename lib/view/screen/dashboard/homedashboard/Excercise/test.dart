import 'dart:io';

import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/components/ButtonWidgetLoader.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:async';
import 'dart:convert';

import 'package:alpersonalcoachingapp/api/UpdateSetApi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';

import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/SetLists.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomList extends StatefulWidget {
  final String title;
  final ExerciseDayList exerciseDayList;
  const CustomList(
      {super.key, required this.title, required this.exerciseDayList});
  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  bool showloginpop = false;
  bool showsendQuery = false;

  TextEditingController commentControlletr = TextEditingController();

  late List<TextEditingController> repsControlletr;
  late List<TextEditingController> weightControlletr;

  int secondsRemaining = 0;
  bool enableResend = false;
  Timer? timer;
  late YoutubePlayerController _controller;
  int currentVideoIndex = 0;
  bool? playbutton = false;
  bool isLoading = false;
  String indexvalue = "";
  bool isSelected = false;
  bool _showProgressIndicator = true;
  String title = "";

  final List<String> videoIds = [
    // Replace with your initial video IDs
  ];
  void switchToNextVideo() {
    if (currentVideoIndex < videoIds.length - 1) {
      currentVideoIndex++;
    } else {
      currentVideoIndex = 0; // Loop back to the first video
    }

    _controller.load(videoIds[currentVideoIndex]);
    _controller.play();
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
    _controller.dispose();
    _controller.pause();
    print("kdjfhg");
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void initState() {
    super.initState();
    title = widget.title;

    videoIds.add(YoutubePlayer.convertUrlToId(
            widget.exerciseDayList.exerciseDetail!.video.toString())
        .toString());
    _controller = YoutubePlayerController(
      initialVideoId: videoIds[currentVideoIndex],
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          showLiveFullscreenButton: false),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          setState(() {
            _showProgressIndicator = false;
          });
        }
      });
    ;

    if (AppHelper.commentId.toString() ==
        widget.exerciseDayList.exerciseDayId.toString()) {
      commentControlletr.text = AppHelper.comment.toString();
    } else {
      if (widget.exerciseDayList.note == null) {
        commentControlletr.text = "";
      } else {
        commentControlletr.text = widget.exerciseDayList.note.toString();
      }
    }
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
          if (secondsRemaining == 0) {
            indexvalue = "";
          }
        });
      } else {}
    });
  }

  Future adddata() async {
    setState(() {
      isLoading = true;
    });
    List<SetLists> setList = [];
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      for (int i = 0; i < widget.exerciseDayList.setList!.length; i++) {
        final datas = widget.exerciseDayList.setList![i].setWeightList;

        for (var element in datas!) {
          setList.add(SetLists(
              id: element.id,
              repsNo: element.repsNo.toString().trim(),
              weight: element.weight.toString().trim()));
        }
      }
      Map<String, dynamic> data = {
        "note": commentControlletr.text.toString(),
        "setWeightList": setList,
      };
      AppHelper.comment = commentControlletr.text.toString();
      AppHelper.commentId = widget.exerciseDayList.exerciseDayId.toString();

      UpdateSetApi responsedata = UpdateSetApi(data);
      final response = await responsedata
          .updateSetValue(widget.exerciseDayList.id.toString());

      if (response['status'] == "success") {
        setState(() {
          isLoading = false;
        });
        DialogHelper.showFlutterToast(strMsg: Languages.of(context)!.success);
        Navigator.of(context).pop();
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
    }
  }

  int _minutes = 0;
  int _seconds = 0;
  late Timer _timer;

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "$min" : "$min";
    String second = sec.toString().length <= 1 ? "$sec" : "$sec";
    _minutes = int.parse(minute);
    _seconds = int.parse(second);
    countDownTime();
  }

  countDownTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            // Countdown timer has reached zero
            // You can perform any action here
            print("Countdown complete!");
            _timer.cancel(); // Stop the timer
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        print("dfkjhgjkdf");
        setState(() {
          _showProgressIndicator = false;
        });
      }
    });
    print("dkjfhgjd");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppHelper.themelight
            ? AppColors.primarycolorYellow
            : AppColors.primarycolor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0,
        centerTitle: true,
        title: Text(
          " " + Languages.of(context)!.totalExcercise,
          style:
              AppStyle.cardtitle.copyWith(fontSize: 18.sp, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 38.h,
            width: 100.h,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 28.h,
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.transparent,
                        onEnded: (metaData) {
                          videoIds.clear();

                          // videoIds.add('');
                          switchToNextVideo();
                        },
                        onReady: () {
                          // videoIds.add('');
                          //switchToNextVideo();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  videoIds.clear();
                                  indexvalue = "";
                                  videoIds.add(YoutubePlayer.convertUrlToId(
                                          widget.exerciseDayList.exerciseDetail!
                                              .video
                                              .toString())
                                      .toString());
                                  switchToNextVideo();
                                },
                                child: SizedBox(
                                  width: 60.w,
                                  child: Text(
                                    widget.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AppHelper.themelight
                                        ? AppStyle.onbaordtitle
                                        : AppStyle.welcometext,
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: 2,
                              ),
                              Icon(Icons.watch_later_outlined,
                                  color: AppColors.primarycolor),
                              SizedBox(
                                width: 2,
                              ),
                              secondsRemaining != 0
                                  ? Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppHelper.themelight
                                                  ? AppColors.whiteColor
                                                  : AppColors.primarycolor)),
                                      child: Text(
                                        '$_minutes:${_seconds.toString().padLeft(2, '0')}',
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
                                  title.toString() +
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
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      tarining(),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Languages.of(context)!.comment,
                              style: AppHelper.themelight
                                  ? AppStyle.cardsubtitledark
                                  : AppStyle.cardsubtitle,
                            ),
                            TextFormField(
                                controller: commentControlletr,
                                onChanged: (value) {
                                  commentControlletr.text = value;
                                },
                                keyboardType: Platform.isIOS
                                    ? TextInputType.numberWithOptions(
                                        signed: true,
                                        decimal: true,
                                      )
                                    : TextInputType.text,
                                minLines: 1,
                                maxLines: 10,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                                // maxLength: 1000,
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).cardTheme.color,
                                  hintText: Languages.of(context)!.writeComment,
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
                            !isLoading
                                ? SubmitButton(
                                    text: Languages.of(context)!.updateNow,
                                    onTap: () {
                                      if (isLoading) {
                                        return;
                                      }
                                      adddata();
                                    },
                                  )
                                : ButtonWidgetLoader(),
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

  Widget tarining() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.exerciseDayList.setList!.length,
      itemBuilder: (context, index) {
        final data = widget.exerciseDayList.setList![index];

        repsControlletr = List<TextEditingController>.generate(
            data.setWeightList!.length,
            (index) => TextEditingController(
                text: data.setWeightList![index].repsNo.toString()));

        weightControlletr = List<TextEditingController>.generate(
            data.setWeightList!.length,
            (index) => TextEditingController(
                text: data.setWeightList![index].weight.toString()));

        return tariningSets(data, index);
      },
    );
  }

  Widget tariningSets(SetList data, int index) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                  child: Text(
                    data.setName.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: AppHelper.themelight
                        ? AppStyle.cardsubtitledark
                        : AppStyle.cardsubtitle,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: data.dropTimes != null
                      ? Text(
                          "(${data.dropTimes})"
                          " ${Languages.of(context)!.drops}",
                          overflow: TextOverflow.ellipsis,
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                        )
                      : Text(
                          data.repsDetail?.repsName.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                        ),
                ),
              ],
            ),
            index.toString() != indexvalue
                ? InkWell(
                    onTap: () {
                      data.likeslected = true;
                      videoIds.clear();
                      title = data.setName.toString();

                      videoIds.add(
                          YoutubePlayer.convertUrlToId(data.video.toString())
                              .toString());
                      switchToNextVideo();

                      setState(() {
                        indexvalue = index.toString();
                        secondsRemaining = int.parse(data.restTime!.isEmpty
                            ? "60"
                            : data.restTime.toString());
                        formattedTime(timeInSecond: secondsRemaining);
                      });
                    },
                    child: const Icon(
                      Icons.play_circle_fill_rounded,
                      size: 60,
                      color: Colors.green,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      data.likeslected = true;
                      videoIds.clear();

                      videoIds.add(
                          YoutubePlayer.convertUrlToId(data.video.toString())
                              .toString());

                      switchToNextVideo();

                      /// _controller.pause();

                      setState(() {
                        indexvalue = '';
                        secondsRemaining = int.parse(data.restTime!.isEmpty
                            ? "60"
                            : data.restTime.toString());
                        formattedTime(timeInSecond: secondsRemaining);
                        // startTimer();
                      });
                    },
                    child: const Icon(
                      Icons.play_circle_fill_rounded,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      Languages.of(context)!.reps,
                      style: AppHelper.themelight
                          ? AppStyle.cardsubtitledark
                          : AppStyle.cardsubtitle,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      Languages.of(context)!.weight,
                      style: AppHelper.themelight
                          ? AppStyle.cardsubtitledark
                          : AppStyle.cardsubtitle,
                    ),
                  ],
                ),
                Container(
                  width: 20.h,
                  margin: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.setWeightList!.length,
                    itemBuilder: (context, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: 15.w,
                            height: 5.h,
                            child: TextField(
                              controller: repsControlletr[i],
                              maxLines: 1,
                              cursorHeight: 18,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                              onChanged: (value) {
                                data.setWeightList![i].repsNo =
                                    int.parse(value);
                              },
                              style: AppStyle.cardsubtitle.copyWith(
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.1.h,
                                ),
                                hintText: "00",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: 15.w,
                            height: 5.h,
                            child: TextField(
                              controller: weightControlletr[i],
                              maxLines: 1,
                              keyboardType: Platform.isIOS
                                  ? TextInputType.numberWithOptions(
                                      signed: true,
                                      decimal: true,
                                    )
                                  : TextInputType.number,
                              onChanged: (value) {
                                data.setWeightList![i].weight = value;
                              },
                              style: AppStyle.cardsubtitle.copyWith(
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.1.h,
                                ),
                                hintText: "00",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
