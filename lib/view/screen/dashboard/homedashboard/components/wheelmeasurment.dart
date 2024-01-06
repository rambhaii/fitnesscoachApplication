// ignore_for_file:

import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsmeasurmentScreenActivity extends StatefulWidget {
  final dynamic currentValue;
  final dynamic changeValue;

  const WeekLyDetailsmeasurmentScreenActivity({
    super.key,
    required this.currentValue,
    required this.changeValue,
  });

  @override
  State<WeekLyDetailsmeasurmentScreenActivity> createState() =>
      _WeekLyDetailsmeasurmentScreenActivityState();
}

class _WeekLyDetailsmeasurmentScreenActivityState
    extends State<WeekLyDetailsmeasurmentScreenActivity> {
  int changeValues = 0;
  int currentsValues = 0;
  @override
  void initState() {
    if (widget.changeValue.toString() != "null") {
      changeValues = int.parse(widget.changeValue.toString()).abs();
    } else {
      changeValues = 0;
    }

    if (widget.currentValue.toString() != "null") {
      currentsValues = int.parse(widget.currentValue.toString()).abs();
    } else {
      currentsValues = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = 50;
    return Center(
      child: Container(
        height: 30.w,
        width: 30.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
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
                    value: progressValue,
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
                // MarkerPointer(
                //   animationDuration: 2000,
                //   enableAnimation: true,
                //   value: progressValue,
                //   markerType: MarkerType.circle,
                //   color: AppHelper.themelight
                //       ? AppColors.primarycolorYellow
                //       : AppColors.primarycolor,
                //   markerWidth: 15,
                //   markerHeight: 15,
                // )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  positionFactor: 0,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        currentsValues.toString() + " cm",
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark
                                .copyWith(fontSize: 14.sp)
                            : AppStyle.cardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            changeValues.toString() + "cm",
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                    .copyWith(fontSize: 11.sp)
                                : AppStyle.cardsubtitle
                                    .copyWith(fontSize: 11.sp),
                          ),
                          changeValues >= 0
                              ? Image.asset("assets/images/upwardarrow.png",
                                  height: 2.h,
                                  width: 2.h,
                                  color: AppHelper.themelight
                                      ? AppColors.primarycolorYellow
                                      : AppColors.primarycolor)
                              : Image.asset("assets/images/downarrow.png",
                                  height: 2.h,
                                  width: 2.h,
                                  color: AppHelper.themelight
                                      ? AppColors.primarycolorYellow
                                      : AppColors.redColor),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
