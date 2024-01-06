import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/InfoContainerboxAvtarUi.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvtarRotation extends StatefulWidget {
  const AvtarRotation({super.key});

  @override
  State<AvtarRotation> createState() => _AvtarRotationState();
}

class _AvtarRotationState extends State<AvtarRotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: "Results",
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoContainerboxAvtarUi(
                title: "Current Fitness",
                subtitle: Languages.of(context)!.upload,
                image: 'assets/images/gif3.gif',
                onTap: () {
                  //s openImages();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              InfoContainerboxAvtarUi(
                title: "Previous Fitness",
                subtitle: Languages.of(context)!.upload,
                image: 'assets/images/gif3.gif',
                onTap: () {
                  //s openImages();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
