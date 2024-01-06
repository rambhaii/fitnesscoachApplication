import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/HomePageModel.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/DashBoardProvider.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/components/Appiconsbutton.dart';
import 'package:alpersonalcoachingapp/utils/extentions.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/utils/showExitPopup.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/components/mealplanbannerui.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/bodysdetails.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/newheader.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/weeklysDetails.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDashboardScreenActivity extends StatefulWidget {
  final Function callback;
  const HomeDashboardScreenActivity({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _HomeDashboardScreenActivityState createState() =>
      _HomeDashboardScreenActivityState();
}

class _HomeDashboardScreenActivityState
    extends State<HomeDashboardScreenActivity> {
  DarkThemeProvider foodcategoriesProvider = DarkThemeProvider();

  DashBoardProvider _dashBoardProvider = DashBoardProvider();
  bool isUpdate = false;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _dashBoardProvider = Provider.of<DashBoardProvider>(context, listen: false);
    _dashBoardProvider.getHomedata();
  }

  Widget _icon(IconData icon, {Color color = AppColors.primarycolor}) {
    return CircleAvatar(
      radius: 3.h,
      backgroundColor: AppColors.whiteColor.withOpacity(0.2),
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 2.6.h,
          backgroundImage: AppHelper.userAvatar != null
              ? NetworkImage(APIURL.imageurl + AppHelper.userAvatar!)
              : AssetImage(
                  AppImages.profile,
                ) as ImageProvider,
        ),
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  getPackGeInf() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Consumer<DarkThemeProvider>(
          builder: (context, darkThemeProvider, child) {
        return SafeArea(child: Consumer<DashBoardProvider>(
            builder: ((context, dashBoardProvider, child) {
          return Padding(
              padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 4,
                        child:
                            _icon(Icons.sort, color: Colors.white).ripple(() {
                          widget.callback("okopen");
                        }),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: Languages.of(context)!.good,
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                      .copyWith(fontSize: 16.sp)
                                  : AppStyle.cardtitle
                                      .copyWith(fontSize: 16.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " ${AppHelper().greeting(context)}",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark.copyWith(
                                            color: AppHelper.themelight
                                                ? AppColors.primarycolorYellow
                                                : AppColors.primarycolor,
                                            fontSize: 16.sp)
                                        : AppStyle.cardtitle.copyWith(
                                            color: AppHelper.themelight
                                                ? AppColors.primarycolorYellow
                                                : AppColors.primarycolor,
                                            fontSize: 16.sp)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${AppHelper.firstName}',
                              style: AppHelper.themelight
                                  ? AppStyle.cardsubtitledark
                                      .copyWith(fontSize: 15.sp)
                                  : AppStyle.cardsubtitle
                                      .copyWith(fontSize: 15.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ",",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark.copyWith(
                                            color: AppHelper.themelight
                                                ? AppColors.primarycolorYellow
                                                : AppColors.primarycolor,
                                            fontSize: 15.sp)
                                        : AppStyle.cardtitle.copyWith(
                                            color: AppHelper.themelight
                                                ? AppColors.primarycolorYellow
                                                : AppColors.primarycolor,
                                            fontSize: 15.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        children: [
                          AppIconButtonsScreenActivity(
                              icondata: Icons.notifications_none,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.notificationScreen);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Scaffold(
                                //       appBar: PreferredSize(
                                //         preferredSize: Size.fromHeight(50),
                                //         child: AppBarScreens(
                                //           title: Languages.of(context)!
                                //               .notifications,
                                //         ),
                                //       ),
                                //       body: NoDataFoundErrorScreens(
                                //           title:
                                //               'Notifications are not available '),
                                //     ),
                                //   ),
                                // );
                              }),
                          Positioned(
                            top: -5,
                            left: 14,
                            child: Container(
                              height: 4.w,
                              width: 4.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  color: Colors.white.withOpacity(0.9),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  dashBoardProvider.countnotification,
                                  style: AppStyle.cardsubtitle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 4.w,
                      ),

                      AppIconButtonsScreenActivity(
                        icondata: Icons.photo_library_outlined,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.gallaryScreenActivity);
                        },
                      ),
                      // SizedBox(
                      //   width: 4.w,
                      // ),
                      // AppIconButtonsScreenActivity(
                      //     icondata: Icons.settings,
                      //     onTap: () {
                      //       Navigator.pushNamed(
                      //           context, Routes.settingScreenActivity);
                      //     }),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: 2.h,
                        ),

                        NewArrivalsHeader(
                          onTap: () {
                            // if (AppStringFile.isUpdate == "true")
                            // {}
                            //   Navigator.pushNamed(context,
                            //       Routes.homepageinfotabbarSCreenActivity);
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // SubscriptionHomeUiScreenACtivity(
                        //   title: Languages.of(context)!.Offers,
                        //   icon: Icons.celebration,
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, Routes.subscriptionScreenActivity);
                        //   },
                        // ),
                        SizedBox(
                          height: 2.h,
                        ),
                        dashBoardProvider.datanotfound
                            ? Column(
                                children: [
                                  dashBoardProvider.datanotfound
                                      ? WeekLyDetailsScreenActivity(
                                          homedata:
                                              dashBoardProvider.homedatalist,
                                        )
                                      : Center(
                                          child: LoaderScreennew(),
                                        ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardTheme.color,
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  Languages.of(context)!
                                                      .currentWeight,
                                                  style: AppHelper.themelight
                                                      ? AppStyle.resultfontstyle
                                                      : AppStyle.resultfont),
                                              Text(
                                                  '${dashBoardProvider.homedatalist.currentWeight ?? ''} kg',
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              fontSize: 18.sp)
                                                      : AppStyle.cardtitle
                                                          .copyWith(
                                                              fontSize: 18.sp)),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              AspectRatio(
                                                aspectRatio: 6.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 18,
                                                    left: 10,
                                                    top: 1,
                                                    bottom: 5,
                                                  ),
                                                  child: LineChart(
                                                    mainData(dashBoardProvider
                                                        .homedatalist
                                                        .weightData),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        Languages.of(context)!
                                                            .start,
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .resultfontstyle
                                                            : AppStyle
                                                                .resultfont),
                                                    Text(
                                                        Languages.of(context)!
                                                            .current,
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .resultfontstyle
                                                            : AppStyle
                                                                .resultfont),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  dashBoardProvider.datanotfound
                                      ? Wrap(
                                          spacing: 12.0,
                                          runSpacing: 12.0,
                                          children: [
                                            BodysDetailsScreenACtivity(
                                              currentValue: dashBoardProvider
                                                  .homedatalist.currentBiceps
                                                  .toString(),
                                              changeValue: dashBoardProvider
                                                  .homedatalist.changBiceps
                                                  .toString(),
                                              title:
                                                  Languages.of(context)!.biceps,
                                              value: 10.0,
                                              icon: AppImages.biceps,
                                            ),
                                            BodysDetailsScreenACtivity(
                                              currentValue: dashBoardProvider
                                                  .homedatalist.currentButt
                                                  .toString(),
                                              changeValue: dashBoardProvider
                                                  .homedatalist.changButt
                                                  .toString(),
                                              title: Languages.of(context)!.bum,
                                              value: 10.0,
                                              icon: AppImages.butt,
                                            ),
                                            BodysDetailsScreenACtivity(
                                              currentValue: dashBoardProvider
                                                  .homedatalist.currentWaist
                                                  .toString(),
                                              changeValue: dashBoardProvider
                                                  .homedatalist.changetWaist
                                                  .toString(),
                                              title:
                                                  Languages.of(context)!.waist,
                                              value: 10.0,
                                              icon: AppImages.waist,
                                            ),
                                            BodysDetailsScreenACtivity(
                                              currentValue: dashBoardProvider
                                                  .homedatalist.currentThighs
                                                  .toString(),
                                              changeValue: dashBoardProvider
                                                  .homedatalist.changetThighs
                                                  .toString(),
                                              title: Languages.of(context)!.leg,
                                              value: 10.0,
                                              icon: AppImages.leg,
                                            )
                                          ],
                                        )
                                      : Center(
                                          child: LoaderScreennew(),
                                        ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              )
                            : Center(
                                child: LoaderScreennew(),
                              )
                      ]),
                    ),
                  )
                ],
              ));
        })));
      }),
    );
  }
}

LineChartData mainData(List<WeightData>? weightData) {
  double gy = 0.0,
      gy1 = 0.0,
      gy2 = 0.0,
      gy3 = 0.0,
      gy4 = 0.0,
      gy5 = 0.0,
      gy6 = 0.0,
      gy7 = 0.0;
  if (weightData!.isNotEmpty) {
    int i;
    for (i = 0; i < weightData.length; i++) {
      if (i == 0) {
        gy = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 1) {
        gy1 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 2) {
        gy2 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 3) {
        gy3 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 4) {
        gy4 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 5) {
        gy5 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 6) {
        gy6 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      } else if (i == 7) {
        gy7 = weightData[i].weight.toString() == "null"
            ? double.parse('0')
            : double.parse(weightData[i].weight.toString() ?? '0');
      }
    }
  }

  return LineChartData(
    borderData: FlBorderData(show: false),
    gridData: const FlGridData(show: false),
    titlesData: const FlTitlesData(show: false),
    minX: 0,
    maxX: 100,
    minY: 0,
    maxY: 100,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 100),
          FlSpot(10, gy),
          FlSpot(20, gy1),
          FlSpot(30, gy2),
          FlSpot(40, gy3),
          FlSpot(50, gy4),
          FlSpot(60, gy5),
          FlSpot(70, gy6),
          FlSpot(80, gy7),
          FlSpot(99, gy7),
        ],
        isCurved: true,
        color: AppHelper.themelight
            ? AppColors.primarycolor.withOpacity(.2)
            : AppColors.primarycolor.withOpacity(.3),
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ],
  );
}
