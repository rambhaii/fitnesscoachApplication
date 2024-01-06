import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/HomePageModel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsScreenActivity extends StatefulWidget {
  final Homedata homedata;
  const WeekLyDetailsScreenActivity({super.key, required this.homedata});

  @override
  State<WeekLyDetailsScreenActivity> createState() =>
      _WeekLyDetailsScreenActivityState();
}

class _WeekLyDetailsScreenActivityState
    extends State<WeekLyDetailsScreenActivity> {
  double targetWeightvalue = 0.0;
  double activeweight = 0;
  String? message = "";
  int value = 0;

  @override
  void initState() {
    print("fdghfghdfg " + widget.homedata.targetWeight.toString());

    if (widget.homedata.targetWeight != null) {
      if (int.parse(widget.homedata.targetWeight.toString()) >= 0) {
        targetWeightvalue =
            double.parse(widget.homedata.targetWeight.toString()) + 0.1;
      } else {
        targetWeightvalue =
            double.parse(widget.homedata.targetWeight.toString()).abs() + 0.1;
        //message = Languages.of(context)!.getdown;
      }
    }

    if (widget.homedata.changeWeight != null) {
      print("fghfgh " + widget.homedata.changeWeight.toString());
      value = int.parse(widget.homedata.changeWeight.toString());
      if (int.parse(widget.homedata.changeWeight.toString()) >= 0) {
        activeweight = double.parse(widget.homedata.changeWeight.toString());
      } else {
        activeweight =
            double.parse(widget.homedata.changeWeight.toString()).abs();
      }
    } else {
      value = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.homedata.targetWeight != null
        ? Container(
            // height: 80.w,
            // width: 100.w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Stack(
              children: [
                Container(
                  height: 75.w,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: targetWeightvalue,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: 0.8,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          color: AppColors.primarycolor.withOpacity(.2),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: activeweight,
                              width: 0.2,
                              animationDuration: 2000,
                              enableAnimation: true,
                              sizeUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.startCurve,
                              gradient: SweepGradient(colors: <Color>[
                                AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor
                              ], stops: <double>[
                                0.25,
                                0.75
                              ])),
                          MarkerPointer(
                            value: activeweight,
                            animationDuration: 2000,
                            enableAnimation: true,
                            markerType: MarkerType.circle,
                            color: AppHelper.themelight
                                ? AppColors.primarycolorYellow
                                : AppColors.primarycolor,
                            markerWidth: 40,
                            markerHeight: 40,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0,
                            widget: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    value >= 0
                                        ? Languages.of(context)!.getup
                                        : Languages.of(context)!.getdown,
                                    style: AppHelper.themelight
                                        ? AppStyle.resultfontstyle
                                            .copyWith(fontSize: 12)
                                        : AppStyle.resultfont
                                            .copyWith(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    activeweight.toStringAsFixed(0) + ' Kg',
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark
                                            .copyWith(fontSize: 22.sp)
                                        : AppStyle.cardtitle
                                            .copyWith(fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "  " +
                                        Languages.of(context)!.getdownmessage +
                                        " " +
                                        targetWeightvalue.toStringAsFixed(0) +
                                        ' Kg',
                                    style: AppHelper.themelight
                                        ? AppStyle.resultfontstyle
                                            .copyWith(fontSize: 12)
                                        : AppStyle.resultfont
                                            .copyWith(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // GaugeAnnotation(
                          //     positionFactor: 0,
                          //     widget: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Text(
                          //           'Vecka 3',
                          //           style: AppStyle.cardsubtitle,
                          //         ),
                          //       ],
                          //     ))
                        ]),
                  ]),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 28.h,
                    bottom: 0,
                    child: widget.homedata.totalWeekCount! >= 0
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 5),
                            child: Text(
                                widget.homedata.totalWeekCount! >= 0
                                    ? Languages.of(context)!.week +
                                            " " +
                                            widget.homedata.totalWeekCount
                                                .toString() ??
                                        ''
                                    : "",
                                style: AppHelper.themelight
                                    ? AppStyle.resultfontstyle
                                    : AppStyle.resultfont),
                          )
                        : Center()),
              ],
            ),
          )
        : Center();
  }
}
