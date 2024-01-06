import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/changelanguagepopup.dart';
import 'package:alpersonalcoachingapp/view/screen/drawer/DrawerItemui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuBarScreens extends StatefulWidget {
  const MenuBarScreens({Key? key}) : super(key: key);

  @override
  State<MenuBarScreens> createState() => _MenuBarScreensState();
}

class _MenuBarScreensState extends State<MenuBarScreens> {
  bool showpop = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      backgroundColor: Theme.of(context).cardTheme.color,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4.w),
                bottomRight: Radius.circular(4.w),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 7.h, right: 2.h, left: 2.h, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                        height: 25.w,
                        child: AppHelper.themelight
                            ? Image.asset(
                                AppImages.blacklogo,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                AppImages.logo,
                                fit: BoxFit.fill,
                              )

                        //  Image.asset(
                        //   AppImages.logo,
                        //   fit: BoxFit.fill,
                        // ),

                        ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    height: 1.h,
                    color: AppColors.greyColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.h,
                      right: 1.h,
                      left: 1.h,
                    ),
                    child: Column(
                      children: [
                        DrawerItem(
                          icon: Icons.home,
                          title: Languages.of(context)!.home,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.dashBoardScreenActivity);
                          },
                        ),
                        // DrawerItem(
                        //   icon: Icons.search,
                        //   title: Languages.of(context)!.search,
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, Routes.searchScreentActivity);
                        //   },
                        // ),
                        // DrawerItem(
                        //   icon: Icons.fitness_center_rounded,
                        //   title: Languages.of(context)!.training,
                        //   onTap: () {},
                        // // ),
                        // DrawerItem(
                        //   icon: Icons.fastfood_outlined,
                        //   title: Languages.of(context)!.mealplan,
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, Routes.mealPlanScreenActivity);
                        //   },
                        // ),

                        // DrawerItem(
                        //   icon: Icons.favorite,
                        //   title: Languages.of(context)!.myfavorites,
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, Routes.favoriteScreenActivity);
                        //   },
                        // ),
                        // DrawerItem(
                        //   icon: Icons.translate,
                        //   title: Languages.of(context)!.changelanguage,
                        //   onTap: () {
                        //     setState(() {
                        //       showpop = true;
                        //     });
                        //   },
                        // ),
                        DrawerItem(
                          icon: Icons.stars,
                          title: Languages.of(context)!.package,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.packageScreenActivity);
                          },
                        ),
                        DrawerItem(
                          icon: Icons.settings,
                          title: Languages.of(context)!.settings,
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.settingScreenActivity);
                          },
                        ),
                        // DrawerItem(
                        //   icon: Icons.help,
                        //   title: Languages.of(context)!.helpnsupport,
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //         context, Routes.webviewWidgetUIScreen,
                        //         arguments: {
                        //           AppStringFile.title:
                        //               Languages.of(context)!.helpnsupport,
                        //           AppStringFile.url: APIURL.contactus,
                        //         });
                        //   },
                        // ),

                        DrawerItem(
                          icon: Icons.logout,
                          title: AppHelper.userid == null
                              ? Languages.of(context)!.login
                              : Languages.of(context)!.logout,
                          onTap: () async {
                            return showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text(
                                  Languages.of(context)!.logout,
                                  style: AppHelper.themelight
                                      ? AppStyle.cardtitledark
                                          .copyWith(fontSize: 18.sp)
                                      : AppStyle.cardtitle
                                          .copyWith(fontSize: 18.sp),
                                ),
                                content: Text(
                                  Languages.of(context)!.logoutmsg,
                                  style: AppHelper.themelight
                                      ? AppStyle.cardsubtitledark
                                      : AppStyle.cardsubtitle,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text(Languages.of(context)!.no,
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark
                                            : AppStyle.cardtitle),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      if (AppHelper.userid == null) {
                                        Navigator.pushNamed(context,
                                            Routes.loginScreenActivity);
                                      } else {
                                        AppHelper.logout();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamedAndRemoveUntil(
                                                Routes.loginScreenActivity,
                                                (Route<dynamic> route) =>
                                                    false);
                                      }
                                    },
                                    child: Text(Languages.of(context)!.yes,
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark
                                            : AppStyle.cardtitle),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CoachbyApp \nv1.0.0",
                        textAlign: TextAlign.center,
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark.copyWith(
                                fontSize: 13.sp,
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                              )
                            : AppStyle.cardsubtitle.copyWith(
                                fontSize: 13.sp,
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (showpop)
            Center(child: EditLanguagePopup(
              callback: (value) {
                setState(() {
                  showpop = false;
                });
              },
            )),
        ],
      ),
    );
  }
}
