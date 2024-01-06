import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/OnBoardingScreen/size_config.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformScreen.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformthree.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformtwo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabWeeklyUpdate extends StatefulWidget {
  const TabWeeklyUpdate({Key? key}) : super(key: key);

  @override
  State<TabWeeklyUpdate> createState() => _TabWeeklyUpdateState();
}

class _TabWeeklyUpdateState extends State<TabWeeklyUpdate> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List<List<Color>> colors = [
    [
      AppColors.welcomecolorfirst,
      Color(0xffffffff),
      Color(0xffffffff),
      AppColors.welcomecolorfirst,
    ],
    [
      AppColors.welcomecolorsec,
      Color(0xffffffff),
      Color(0xffffffff),
      AppColors.welcomecolorfirst,
    ],
    [
      AppColors.welcomecolor,
      Color(0xffffffff),
      Color(0xffffffff),
      AppColors.welcomecolorfirst,
    ],
  ];
  List tabs = [
    HomeInformationFormScreenActivity(),
    Homeinformationformtwo(),
    Homeinformationformthree(),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: AppColors.primarycolor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 30 : 10,
    );
  }

  double selectedvalue = 0.33;
// selectedvalue = selectedvalue * 2;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: AppHelper.themelight
            ? AppColors.primarycolorYellow
            : AppColors.primarycolor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0,
        centerTitle: true,
        title: 
        Text(
          // _currentIndex == 0
          //     ?
          Languages.of(context)!.weeklyProgress,
          // : appbarTitle,
          style:
              AppStyle.cardtitle.copyWith(fontSize: 18.sp, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.red.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            value: selectedvalue,
            minHeight: 1.h,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.2, 0.7, 1.6],
            colors: colors[_currentPage],
          )),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: tabs.length,
                  itemBuilder: (context, i) {
                    return SafeArea(child: tabs[i]);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage + 1 == tabs.length
                        ? Padding(
                            padding: EdgeInsets.all(1.h),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.loginScreenActivity);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primarycolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: (width <= 550)
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 20)
                                    : EdgeInsets.symmetric(
                                        horizontal: width * 0.2, vertical: 25),
                                textStyle: TextStyle(
                                    fontSize: (width <= 550) ? 13 : 17),
                              ),
                              child: Text(
                                Languages.of(context)!.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.loginScreenActivity);
                                  },
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 550) ? 14 : 17,
                                    ),
                                  ),
                                  child: Text(
                                    Languages.of(context)!.skip,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    tabs.length,
                                    (int index) => _buildDots(
                                      index: index,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 550) ? 14 : 17,
                                    ),
                                  ),
                                  child: Text(
                                    Languages.of(context)!.next,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
