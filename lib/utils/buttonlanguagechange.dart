import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidgetLanguageChanage extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidgetLanguageChanage({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidgetLanguageChanage> createState() =>
      _ButtonWidgetLanguageChanageState();
}

class _ButtonWidgetLanguageChanageState
    extends State<ButtonWidgetLanguageChanage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: ElevatedButton.icon(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primarycolor,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
        ),
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.black,
        ),
        label: Text(
          widget.text ?? '',
          style: AppStyle.onbaordtitle
              .copyWith(fontSize: 16.sp, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
