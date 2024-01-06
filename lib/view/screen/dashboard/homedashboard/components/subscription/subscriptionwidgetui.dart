import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubscriptionWidgetUI extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? buttontext;
  final Function()? onTap;
  const SubscriptionWidgetUI({
    Key? key,
    this.title,
    this.subtitle,
    this.buttontext,
    this.onTap,
  }) : super(key: key);

  @override
  State<SubscriptionWidgetUI> createState() => _SubscriptionWidgetUIState();
}

class _SubscriptionWidgetUIState extends State<SubscriptionWidgetUI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Container(
                  // height: 22.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    // color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(2.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.sell,
                              color: AppHelper.themelight
                                  ? AppColors.primarycolorYellow
                                  : AppColors.primarycolor,
                              size: 2.5.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Testosteronbrist? 200 200",
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                  : AppStyle.cardtitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                            maxLines: 2,
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                    .copyWith(color: AppColors.greyColor)
                                : AppStyle.cardsubtitle
                                    .copyWith(color: AppColors.greyColor),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ButtonWidget(
                          text: "Ga till erbjudande",
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
