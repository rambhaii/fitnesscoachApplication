import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormScreen extends StatelessWidget {
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
  final TextInputType? keyboardType;

  const TextFormScreen({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: readOnly,
      obscureText: suffixIcon ? obscure : false,
      // obscureText1: suffixIcon ? obscure : false,
      keyboardType: keyboardType ?? TextInputType.text,

      cursorColor: AppColors.primarycolor,
      style: AppStyle.cardsubtitle.copyWith(
        color: AppColors.blackColor,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hinttext,
          hintStyle: AppStyle.cardsubtitle.copyWith(
            color: AppColors.greyColor,
            fontSize: 14.sp,
          ),
          // TextStyle(
          //     fontSize: 14.sp,
          //     color: AppColors.greyColor,
          //     fontFamily: 'Poppins'),

          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(2.w),
              )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(2.w),
              )),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(2.w),
              )),
          prefixIcon: Icon(
            icon,
            size: 2.7.h,
            color: AppColors.primarycolor,
          ),
          suffixIcon: suffixIcon
              ? suffixIconWidget ??
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        size: 2.7.h,
                        obscure ? Icons.visibility_off : Icons.visibility,
                        //   obscure1 ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primarycolor,
                      ))
              : null),
      validator: validator,
    );
  }
}
