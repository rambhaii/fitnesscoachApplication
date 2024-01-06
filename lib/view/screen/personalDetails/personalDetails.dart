import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.personalDetails,
        ),
      ),
      body: Consumer<ProfileUserProvider>(
        builder: ((context, profileUserProvider, child) {
          return !profileUserProvider.datanotfound
              ? Center(
                  child: LoaderScreennew(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            profileUserProvider.profileuserList.isNotEmpty
                                ? profileUserProvider
                                        .profileuserList[0].firstName ??
                                    ''
                                : '',
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                    .copyWith(fontSize: 17.sp)
                                : AppStyle.cardtitle.copyWith(fontSize: 17.sp),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            profileUserProvider.profileuserList.isNotEmpty
                                ? profileUserProvider
                                        .profileuserList[0].lastName ??
                                    ''
                                : '',
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                    .copyWith(fontSize: 17.sp)
                                : AppStyle.cardtitle.copyWith(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          profileUserProvider.profileuserList.isNotEmpty
                              ? profileUserProvider
                                      .profileuserList[0].emailAddress ??
                                  ''
                              : '',
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(children: [
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.dob,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider.profileuserList[0]
                                      .clientPersonalDetail!.dob ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.gender,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider.profileuserList[0]
                                      .clientPersonalDetail!.gender ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.startingWeight,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.startingWeight} Kg' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.currentWeight,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.currentWeight} Kg' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.tagetWeight,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.targetWeight} Kg' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          // ListTile(
                          //   dense: true,
                          //   leading: Text(
                          //     Languages.of(context)!.disease,
                          //     style: TextStyle(
                          //         color: AppHelper.themelight
                          //             ? Colors.white
                          //             : AppColors.blackColor,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          //   trailing: Text(
                          //     profileUserProvider.profileuserList[0]
                          //             .clientPersonalDetail!.disease ??
                          //         '',
                          //     style: TextStyle(
                          //       color: AppHelper.themelight
                          //           ? Colors.white
                          //           : AppColors.greyColor,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),

                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.experience,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.experience}' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.trainingDaysPerWeek,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.trainingDaysPerWeek} Days' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.trainingPlace,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider.profileuserList[0]
                                      .clientPersonalDetail!.trainingPlace ??
                                  " ",
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.length,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              '${profileUserProvider.profileuserList[0].clientPersonalDetail!.length} Cm' ??
                                  '',
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.allergies,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider.profileuserList[0]
                                      .clientPersonalDetail!.allergy ??
                                  " ",
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.startDate,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider.profileuserList[0]
                                      .clientPersonalDetail!.startDate ??
                                  " ",
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          // ListTile(
                          //   dense: true,
                          //   leading: Text(
                          //     Languages.of(context)!.tags,
                          //     style: TextStyle(
                          //         color: AppHelper.themelight
                          //             ? Colors.white
                          //             : AppColors.blackColor,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          //   trailing: Text(
                          //     profileUserProvider.profileuserList[0]
                          //             .clientPersonalDetail!.tags ??
                          //         " ",
                          //     style: TextStyle(
                          //       color: AppHelper.themelight
                          //           ? Colors.white
                          //           : AppColors.greyColor,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                          ListTile(
                            dense: true,
                            leading: Text(
                              Languages.of(context)!.socialSecurityNumber,
                              style: TextStyle(
                                  color: AppHelper.themelight
                                      ? Colors.white
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(
                              profileUserProvider
                                      .profileuserList[0]
                                      .clientPersonalDetail!
                                      .socialSecurityNumber ??
                                  " ",
                              style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : AppColors.greyColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
