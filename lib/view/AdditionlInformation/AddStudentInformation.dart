
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/components/AddForm.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddStudentInformation extends StatefulWidget {
  const AddStudentInformation({Key? key}) : super(key: key);

  @override
  State<AddStudentInformation> createState() => _AddStudentInformation();
}

class _AddStudentInformation extends State<AddStudentInformation> {
  bool isLoadingpop = false;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.cutomerInformation,
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 0.h, right: 2.h, left: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                     AppHelper.themelight
                          ? Image.asset(
                              AppImages.blacklogo,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              AppImages.logo,
                              fit: BoxFit.fill,
                            )
                    ],
                  ),
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddForm(
                          callback: (value) {
                            if (value) {
                              setState(() {
                                isloading = true;
                              });
                            } else {
                              setState(() {
                                isloading = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          if (isloading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreen()),
            )
        ],
      ),
    );
  }
}
