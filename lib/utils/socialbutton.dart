import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SocialButton extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final Function()? onPressed;
  const SocialButton({
    Key? key,
    this.image,
    this.text,
    this.onPressed,
    this.boxcolor,
    this.textcolor,
  }) : super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image ?? '',
              height: 5.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              widget.text ?? '',
              style: AppStyle.cardsubtitle.copyWith(
                  color: widget.textcolor ?? Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
