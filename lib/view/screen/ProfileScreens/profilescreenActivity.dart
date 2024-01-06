import 'dart:io';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/changelanguagepopup.dart';
import 'package:alpersonalcoachingapp/utils/settingswidgetui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreenActivity extends StatefulWidget {
  const ProfileScreenActivity({super.key});

  @override
  State<ProfileScreenActivity> createState() => _ProfileScreenActivityState();
}

class _ProfileScreenActivityState extends State<ProfileScreenActivity> {
  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  bool showpop = false;
  bool light = true;
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
            title: Text(Languages.of(context)!.profile,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                        .copyWith(fontSize: 18.sp, color: AppColors.blackColor)
                    : AppStyle.cardtitle.copyWith(
                        fontSize: 18.sp, color: AppColors.blackColor)),
          ),
          body: Consumer<ProfileUserProvider>(
              builder: ((context, profileUserProvider, child) {
            return Stack(
              children: [
                Container(
                  height: 8.h,
                  color: AppHelper.themelight
                      ? AppColors.primarycolorYellow
                      : AppColors.primarycolor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
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
                          Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: profileUserProvider
                                      .profileuserList.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          //  width: 250,
                                          //height: .h,
                                          padding: EdgeInsets.only(left: 35.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 55.w,
                                                        child: Text(
                                                          profileUserProvider
                                                                  .profileuserList
                                                                  .isNotEmpty
                                                              ? profileUserProvider
                                                                          .profileuserList[
                                                                              0]
                                                                          .firstName
                                                                          .toString() +
                                                                      " ${profileUserProvider.profileuserList[0].lastName}" ??
                                                                  ''
                                                              : '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: AppHelper
                                                                  .themelight
                                                              ? AppStyle
                                                                  .cardtitledark
                                                                  .copyWith(
                                                                      fontSize:
                                                                          17.sp)
                                                              : AppStyle
                                                                  .cardtitle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          17.sp),
                                                        ),
                                                      ),
                                                      // SizedBox(
                                                      //   width: 1.w,
                                                      // ),
                                                      // Text(
                                                      //   profileUserProvider
                                                      //           .profileuserList
                                                      //           .isNotEmpty
                                                      //       ? profileUserProvider
                                                      //               .profileuserList[
                                                      //                   0]
                                                      //               .lastName ??
                                                      //           ''
                                                      //       : '',
                                                      //   style: AppHelper
                                                      //           .themelight
                                                      //       ? AppStyle
                                                      //           .cardtitledark
                                                      //           .copyWith(
                                                      //               fontSize:
                                                      //                   17.sp)
                                                      //       : AppStyle.cardtitle
                                                      //           .copyWith(
                                                      //               fontSize:
                                                      //                   17.sp),
                                                      // ),
                                                    ],
                                                  ),
                                                  Text(
                                                    profileUserProvider
                                                            .profileuserList
                                                            .isNotEmpty
                                                        ? profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .emailAddress ??
                                                            ''
                                                        : '',
                                                    style: AppHelper.themelight
                                                        ? AppStyle
                                                            .cardsubtitledark
                                                        : AppStyle.cardsubtitle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container()),
                          SizedBox(
                            height: 1.h,
                          ),
                          Settingwidgetui(
                            icon: Icons.account_circle_rounded,
                            title: Languages.of(context)!.personalDetails,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.personalDetails,
                                  arguments: {
                                    AppStringFile.profileuserdata:
                                        profileUserProvider.profileuserList,
                                  }).then((value) {
                                _profileuserProvider
                                    .profileuserlist(AppHelper.userid ?? '');
                              });
                            },
                          ),
                          // const Divider(
                          //   color: Colors.black12,
                          //   thickness: 1,
                          // ),
                          // Settingwidgetui(
                          //   icon: Icons.edit,
                          //   title: Languages.of(context)!.editprofile,
                          //   onTap: () {
                          //     print(profileUserProvider.profileuserList);
                          //     Navigator.pushNamed(context, Routes.editProfile,
                          //         arguments: {
                          //           AppStringFile.profileuserdata:
                          //               profileUserProvider.profileuserList,
                          //         }).then((value) {
                          //       _profileuserProvider
                          //           .profileuserlist(AppHelper.userid ?? '');
                          //     });
                          //   },
                          // ),
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
                                value: light,
                                activeColor: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    light = value;
                                    AppHelper.themelight =
                                        !AppHelper.themelight;
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
                          Settingwidgetui(
                            icon: Icons.lock,
                            title: Languages.of(context)!.changepasswords,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.changePassword);
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.settings,
                            title: Languages.of(context)!.settings,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.settingScreenActivity);
                            },
                          ),

                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.contact_support,
                            title: Languages.of(context)!.contactsupport,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.contact_support);
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.logout,
                            title: Languages.of(context)!.logout,
                            onTap: () {
                              showDialog(
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
                                        AppHelper.logout();

                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamedAndRemoveUntil(
                                                Routes.loginScreenActivity,
                                                (Route<dynamic> route) =>
                                                    false);
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
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Settingwidgetui(
                              //   icon: Icons.star,
                              //   title: Languages.of(context)!.rateapp,
                              //   onTap: _launchUrl,
                              // ),

                              IconButton(
                                onPressed: () {
                                  if (Platform.isAndroid) {
                                    final Uri _url =
                                        Uri.parse(APIURL.playstoreurl);

                                    _launchUrl(_url);
                                  } else if (Platform.isIOS) {
                                    final Uri _url =
                                        Uri.parse(APIURL.appStorestoreurl);

                                    _launchUrl(_url);
                                  }
                                },
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                icon: const Icon(
                                  Icons.star,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  if (Platform.isAndroid) {
                                    Share.share(
                                        'hey! check out CoachbyApp https://play.google.com/store/apps/details?id=com.coachbyapp.app');
                                  } else if (Platform.isIOS) {
                                    Share.share(
                                        'hey! check out CoachbyApp https://apps.apple.com/in/app/coachbyapp/12345');
                                  }
                                },
                                color: AppHelper.themelight
                                    ? AppColors.primarycolorYellow
                                    : AppColors.primarycolor,
                                icon: const Icon(
                                  Icons.share,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CoachbyApp \nVersion 1.0.0",
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                        .copyWith(fontSize: 13.sp)
                                    : AppStyle.cardsubtitle
                                        .copyWith(fontSize: 13.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
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
                Padding(
                  padding: EdgeInsets.only(top: 1.h, left: 7.w),
                  child: profileUserProvider.profileuserList.isNotEmpty
                      ? Row(
                          children: [
                            CircleAvatar(
                              radius: 6.5.h,
                              backgroundColor: AppHelper.themelight
                                  ? AppColors.primarycolorYellow
                                  : AppColors.primarycolor,
                              child: CircleAvatar(
                                radius: 6.h,
                                backgroundColor:
                                    AppColors.greyColor.withOpacity(0.3),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.editProfile,
                                        arguments: {
                                          AppStringFile.profileuserdata:
                                              profileUserProvider
                                                  .profileuserList,
                                        }).then((value) {
                                      _profileuserProvider.profileuserlist(
                                          AppHelper.userid ?? '');
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 5.5.h,
                                    backgroundImage: profileUserProvider
                                                .profileuserList[0]
                                                .userAvatar !=
                                            null
                                        ? NetworkImage(APIURL.imageurl +
                                            profileUserProvider
                                                .profileuserList[0].userAvatar!)
                                        : AssetImage(
                                            AppImages.profile,
                                          ) as ImageProvider,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  print(profileUserProvider.profileuserList);
                                  Navigator.pushNamed(
                                      context, Routes.editProfile,
                                      arguments: {
                                        AppStringFile.profileuserdata:
                                            profileUserProvider.profileuserList,
                                      }).then((value) {
                                    _profileuserProvider.profileuserlist(
                                        AppHelper.userid ?? '');
                                  });
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: AppHelper.themelight
                                      ? AppColors.primarycolorYellow
                                      : AppColors.blackColor,
                                ))
                          ],
                        )
                      : Container(),
                )
              ],
            );
          })));
    });
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
