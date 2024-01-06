import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeinformationformUiScreenACtivity extends StatefulWidget {
  final String title;
  final color;
  final Function? callback;

  const HomeinformationformUiScreenACtivity({
    this.callback,
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<HomeinformationformUiScreenACtivity> createState() =>
      _HomeinformationformUiScreenACtivityState();
}

class _HomeinformationformUiScreenACtivityState
    extends State<HomeinformationformUiScreenACtivity> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        border: Border.all(color: AppColors.primarycolor, width: 2),
      ),
      child:
          //  RadioListTile(
          //   title: Text(
          //     widget.title,
          //     // "Male",
          //     style: AppStyle.cardtitle.copyWith(color: Colors.white),
          //   ),
          //     value: checked,
          //   groupValue: checked,
          //   dense: checked,
          //   onChanged: (value) {
          //     setState(()
          //      {
          //       print("jhsdkfghdjfgh  " + value.toString());
          //      checked = value!;
          //     });
          //   },
          // ),

          CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.title,
          style: AppStyle.cardtitle.copyWith(color: Colors.white),
        ),
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        value: checked,
        onChanged: (value) {
          setState(() {
            print("sdjgh  " + value.toString());
            widget.callback!(value);
            checked = value!;
          });
        },
      ),
    );
  }
}
