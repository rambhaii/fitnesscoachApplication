import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/GenrateSets.dart';

class SetReps extends StatefulWidget {
  final SetList data;
  const SetReps({super.key, required this.data});

  @override
  State<SetReps> createState() => _SetReps();
}

class _SetReps extends State<SetReps> {
  @override
  Widget build(BuildContext context) {
    return widget.data != null
        ? Card(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 15, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.data.setName.toString(),
                          style: AppHelper.themelight
                              ? AppStyle.cardtitles
                              : AppStyle.cardtitleBlack,
                        ),
                        Text(
                          widget.data.repsDetail?.repsName.toString() ?? '',
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
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
                                GenrateSet(),
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
                                GenrateSet(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          )
        : Center(
            child: Text(" Sets not avaialable"),
          );
  }
}
