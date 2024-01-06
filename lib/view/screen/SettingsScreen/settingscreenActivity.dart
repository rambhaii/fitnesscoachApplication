import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/changelanguagepopup.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/settingswidgetui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenActivity extends StatefulWidget {
  const SettingScreenActivity({super.key});

  @override
  State<SettingScreenActivity> createState() => _SettingScreenActivityState();
}

class _SettingScreenActivityState extends State<SettingScreenActivity> {
  bool showpop = false;
  bool light = true;
  bool notificationval = true;
  final Uri _url = Uri.parse(APIURL.playstoreurl);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return Scaffold(
        backgroundColor: AppHelper.themelight
            ? AppColors.primarycolorYellow
            : AppColors.primarycolor,
        appBar: AppBar(
          backgroundColor: AppHelper.themelight
              ? AppColors.primarycolorYellow
              : AppColors.primarycolor,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(Languages.of(context)!.settings,
              style: AppHelper.themelight
                  ? AppStyle.cardtitledark
                      .copyWith(fontSize: 18.sp, color: AppColors.blackColor)
                  : AppStyle.cardtitle
                      .copyWith(fontSize: 18.sp, color: AppColors.blackColor)),
        ),
        body: Stack(
          children: [
            Container(
              height: 20.h,
              color: AppHelper.themelight
                  ? AppColors.primarycolorYellow
                  : AppColors.primarycolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 5.5.h,
                    backgroundColor: AppColors.greyColor.withOpacity(0.3),
                    child: CircleAvatar(
                      radius: 5.h,
                      backgroundColor: AppColors.greyColor,
                      backgroundImage: AppHelper.userAvatar != null
                          ? NetworkImage(
                              APIURL.imageurl + AppHelper.userAvatar!)
                          : AssetImage(
                              AppImages.profile,
                            ) as ImageProvider,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () 
                          {
                            Navigator.pushNamed(
                                context, Routes.profileScreenActivity);
                          },
                          child: CircleAvatar(
                            radius: 1.7.h,
                            backgroundColor:
                                AppColors.blackColor.withOpacity(0.5),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 2.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${AppHelper.firstName}',
                        //"Deepika",
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark.copyWith(
                                color: AppColors.blackColor, fontSize: 17.sp)
                            : AppStyle.cardtitledark.copyWith(
                                color: AppColors.blackColor, fontSize: 17.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        '${AppHelper.lastName}',
                        style: AppHelper.themelight
                            ? AppStyle.cardtitledark.copyWith(
                                color: AppColors.blackColor, fontSize: 17.sp)
                            : AppStyle.cardtitledark.copyWith(
                                color: AppColors.blackColor, fontSize: 17.sp),
                      ),
                    ],
                  ),
                  Text('${AppHelper.email_VALUE}',
                      //"deepika@imperialit.in",
                      style: AppHelper.themelight
                          ? AppStyle.cardsubtitledark
                              .copyWith(color: AppColors.blackColor)
                          : AppStyle.cardsubtitledark
                              .copyWith(color: AppColors.blackColor))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.contrast,
                                size: 2.5.h,
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                Languages.of(context)!.darkmode,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                            ],
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: light,
                            activeColor: AppHelper.themelight
                                ? AppColors.primarycolorYellow
                                : AppColors.primarycolor,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                light = value;
                                AppHelper.themelight = !AppHelper.themelight;
                              });
                              darkThemeProvider.darkThemessd(true);
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.notifications,
                                size: 23.0,
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                Languages.of(context)!.notifications,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                            ],
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: notificationval,
                            activeColor: AppHelper.themelight
                                ? AppColors.primarycolorYellow
                                : AppColors.primarycolor,
                            onChanged: (bool value) {
                              // This is called when the user toggles the switch.
                              setState(() {
                                notificationval = value;
                                // AppHelper.themelight =
                                //     !AppHelper.themelight;
                              });
                              // darkThemeProvider.darkThemessd(true);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                        icon: Icons.language,
                        title: Languages.of(context)!.changelanguage,
                        onTap: () {
                          setState(() {
                            showpop = true;
                          });
                        },
                      ),

                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                        icon: Icons.perm_phone_msg_outlined,
                        title: Languages.of(context)!.contactus,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.contactUsScreen,
                              arguments: {
                                AppStringFile.title:
                                    Languages.of(context)!.contactus,
                                AppStringFile.url: APIURL.contactus,
                              });
                        },
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                        icon: Icons.supervised_user_circle_rounded,
                        title: Languages.of(context)!.aboutus,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.aboutUsScreen,
                              arguments: {
                                AppStringFile.title:
                                    Languages.of(context)!.aboutus,
                                AppStringFile.url: APIURL.aboutus,
                              });
                        },
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                        icon: Icons.privacy_tip,
                        title: Languages.of(context)!.privacypolicy,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.privacyPolicyScreen,
                              arguments: {
                                AppStringFile.title:
                                    Languages.of(context)!.privacypolicy,
                                AppStringFile.url: APIURL.privacypolicy,
                              });
                        },
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                          icon: Icons.lock_reset,
                          title: Languages.of(context)!.termsandcondition,
                          onTap: ()
                           {
                            Navigator.pushNamed(
                                context, Routes.termsandcondition,
                                arguments: {
                                  AppStringFile.title:
                                      Languages.of(context)!.termsandcondition,
                                  AppStringFile.url: APIURL.termsandcondition,
                                });
                          }),
                      // const Divider(
                      //   color: Colors.black12,
                      //   thickness: 1,
                      // ),
                      // Settingwidgetui(
                      //   icon: Icons.share,
                      //   title: Languages.of(context)!.shareapp,
                      //   onTap: () {
                      //     Share.share(
                      //         'hey! check out CoachbyApp ${APIURL.shareapp}');
                      //   },
                      // ),

                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      Settingwidgetui(
                        icon: Icons.delete_sweep,
                        title: Languages.of(context)!.deleteaccount,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                Languages.of(context)!.deleteaccount,
                                style: AppHelper.themelight
                                    ? AppStyle.cardtitledark
                                        .copyWith(fontSize: 18.sp)
                                    : AppStyle.cardtitle
                                        .copyWith(fontSize: 18.sp),
                              ),
                              content: Text(
                                Languages.of(context)!.deleteaccountmsg,
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                    : AppStyle.cardsubtitle,
                              ),
                              actions: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {});
                                          if (isLoading) {
                                            return;
                                          }

                                          deleteAccount(
                                              AppHelper.userid.toString(),
                                              context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text(
                                          Languages.of(context)!.yes,
                                          style: AppStyle.cardtitle.copyWith(
                                              fontSize: 16.sp,
                                              color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                        child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      child: Text(Languages.of(context)!.no,
                                          style: AppStyle.cardtitle
                                              .copyWith(fontSize: 16.sp)),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      // const Divider(
                      //   color: Colors.black12,
                      //   thickness: 1,
                      // ),
                      // Settingwidgetui(
                      //   icon: Icons.logout,
                      //   title: Languages.of(context)!.logout,
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (ctx) => AlertDialog(
                      //         title: Text(
                      //           Languages.of(context)!.logout,
                      //           style: AppHelper.themelight
                      //               ? AppStyle.cardtitledark
                      //                   .copyWith(fontSize: 18.sp)
                      //               : AppStyle.cardtitle
                      //                   .copyWith(fontSize: 18.sp),
                      //         ),
                      //         content: Text(
                      //           Languages.of(context)!.logoutmsg,
                      //           style: AppHelper.themelight
                      //               ? AppStyle.cardsubtitledark
                      //               : AppStyle.cardsubtitle,
                      //         ),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(ctx).pop();
                      //             },
                      //             child: Text(Languages.of(context)!.no,
                      //                 style: AppHelper.themelight
                      //                     ? AppStyle.cardtitledark
                      //                     : AppStyle.cardtitle),
                      //           ),
                      //           TextButton(
                      //             onPressed: () async {
                      //               AppHelper.logout();
                      //               Navigator.of(context, rootNavigator: true)
                      //                   .pushNamedAndRemoveUntil(
                      //                       Routes.loginScreenActivity,
                      //                       (Route<dynamic> route) => false);
                      //             },
                      //             child: Text(Languages.of(context)!.yes,
                      //                 style: AppHelper.themelight
                      //                     ? AppStyle.cardtitledark
                      //                     : AppStyle.cardtitle),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),

                      const Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CoachbyApp \nVersion v1.0.0",
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                    .copyWith(fontSize: 13.sp)
                                : AppStyle.cardsubtitle
                                    .copyWith(fontSize: 13.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
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
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  deleteAccount(String ids, BuildContext context) async {
    var data = {
      'id': ids,
    };

    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.deleteaccount(ids);
    if (response['status'].toString() == "success") 
    {
      AppHelper.logout();

      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          Routes.loginScreenActivity, (Route<dynamic> route) => false);
      DialogHelper.showFlutterToast(strMsg: response['message'].toString());
    } else {
      DialogHelper.showFlutterToast(strMsg: response['message'].toString());
    }
  }
}
