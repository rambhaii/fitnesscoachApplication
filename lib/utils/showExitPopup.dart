import 'dart:io';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/Chat/SocketService.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<bool> showExitPopup(context) async
 {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.wanttoexitapp,
                  style: AppStyle.onbaordtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          SocketService.dispose();
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primarycolor),
                        child: Text(
                          Languages.of(context)!.yes,
                          style: AppStyle.cardtitle.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(Languages.of(context)!.no,
                          style: AppStyle.cardtitle.copyWith(fontSize: 16.sp)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
