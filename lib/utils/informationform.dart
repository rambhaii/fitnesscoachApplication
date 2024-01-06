import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class InformationTextFormScreen extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final String hinttext;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const InformationTextFormScreen({
    Key? key,
    this.focusNode,
    required this.textEditingController,
    required this.hinttext,
    required this.icon,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 5,
            ),
          ]),
      child: SizedBox(
        height: 6.h,
        width: 35.w,
        child: TextFormField(
          focusNode: focusNode,
          onChanged: onChanged,
          controller: textEditingController,
          readOnly: readOnly,
          obscureText: suffixIcon ? obscure : false,
          keyboardType: keyboardType,
          style: AppHelper.themelight
              ? AppStyle.cardtitledark
              : AppStyle.cardtitle,
          cursorColor: AppColors.primarycolor,
          decoration: InputDecoration(
              fillColor: Theme.of(context).cardTheme.color,

              // Colors.white,
              filled: true,
              hintText: hinttext,
              hintStyle: TextStyle(
                  fontSize: 14.sp, fontFamily: 'Roboto', color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.w),
                  )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.w),
                  )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.w),
                  )),
              // prefixIcon: Icon(
              //   icon,
              //   color: Colors.white,
              //   size: 3.h,
              //   // color: AppColors.appPrimarycolor,
              // ),
              suffixIcon: suffixIcon
                  ? suffixIconWidget ??
                      IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility,
                            //   obscure1 ? Icons.visibility_off : Icons.visibility,
                            // color: colorBlack,
                          ))
                  : null),
          validator: validator,
        ),
      ),
    );
  }
}
