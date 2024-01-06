import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeinformationformUiwhiteScreenACtivity extends StatefulWidget {
  final String title;
  final color;
  const HomeinformationformUiwhiteScreenACtivity({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<HomeinformationformUiwhiteScreenACtivity> createState() =>
      _HomeinformationformUiwhiteScreenACtivityState();
}

class _HomeinformationformUiwhiteScreenACtivityState
    extends State<HomeinformationformUiwhiteScreenACtivity> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        border: Border.all(color: AppColors.greyColor, width: 1),
      ),
      child: RadioListTile(
        title: Text(
          widget.title,
          style: AppStyle.cardtitle.copyWith(color: Colors.white),
        ),
        selectedTileColor: AppColors.appcardColor,
        value: "value",
        groupValue: gender,
        onChanged: (value) {
          setState(() {
            gender = value.toString();
          });
        },
      ),
    );
  }
}
