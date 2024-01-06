import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewArrivalsHeader extends StatefulWidget {
  final Function? onTap;
  const NewArrivalsHeader({Key? key, this.onTap}) : super(key: key);

  @override
  _NewArrivalsHeaderState createState() => _NewArrivalsHeaderState();
}

class _NewArrivalsHeaderState extends State<NewArrivalsHeader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap!.call(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Container(
                height: 20.h,
                margin: EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/imagebanner.jpg"),
                      fit: BoxFit.fitWidth),
                  // color: AppHelper.themelight
                  //     ? AppColors.primarycolorYellow
                  //     : AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              bottom: 20,
              child: SizedBox(
                width: 35.w,
                child: Text(
                  Languages.of(context)!.fitnessOnlineTrainingCoach,
                  maxLines: 4,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitle.copyWith(
                          fontSize: 20.sp, color: AppColors.whiteColor)
                      : AppStyle.cardtitle.copyWith(
                          fontSize: 20.sp, color: AppColors.whiteColor),
                ),
              ),
            ),
            // Positioned(
            //     top: -10,
            //     right: 30,
            //     child: Image.asset(
            //       AppImages.clock,
            //       height: 160,
            //     )),
            if (AppStringFile.isUpdate == "true")
              Positioned(
                bottom: 10,
                right: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.homepageinfotabbarSCreenActivity);
                        },
                        child: Container(
                            height: 9.w,
                            width: 9.w,
                            decoration: BoxDecoration(
                              color: AppColors.iconboxcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            Positioned(
              bottom: 10,
              left: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.avtarRotation);
                      },
                      child: Container(
                          height: 9.w,
                          width: 9.w,
                          decoration: BoxDecoration(
                            color: AppColors.iconboxcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
