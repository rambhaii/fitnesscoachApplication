import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';

import 'package:alpersonalcoachingapp/provider/NotificationProvider.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationProvider _dashboardProvider = NotificationProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _dashboardProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    _dashboardProvider.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    print("   vdxfgdkjfhgdkjf");
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              title: Languages.of(context)!.notifications,
            )),
        body: Consumer<NotificationProvider>(
            builder: ((context, notificationProvider, child) {
          return SafeArea(
            child: notificationProvider.datanotfound
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        notificationProvider.notificationlistData.isNotEmpty
                            ? ListView.builder(
                                itemCount: notificationProvider
                                    .notificationlistData.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      if (notificationProvider
                                              .notificationlistData[index].path
                                              .toString() ==
                                          "exercise") {
                                        Navigator.pushNamed(
                                            context, Routes.exerciseType);
                                      } else {
                                        Navigator.pushNamed(context,
                                            Routes.coachmanScreenActivity);
                                      }

                                      //exerciseType
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.h,
                                          left: 1.5.h,
                                          right: 1.5.h,
                                          bottom: 0.2.h),
                                      child: InkWell(
                                        child: Slidable(
                                          actionPane:
                                              SlidableDrawerActionPane(),
                                          actionExtentRatio: 0.25,
                                          secondaryActions: <Widget>[
                                            IconSlideAction(
                                              caption:
                                                  Languages.of(context)!.delete,
                                              //"delete",
                                              onTap: () {
                                                _dialogBuilder(context);
                                              },
                                              iconWidget: Center(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .cardTheme
                                                      .color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.w),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(1.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 4.h,
                                                        backgroundImage: notificationProvider
                                                                    .notificationlistData[
                                                                        index]
                                                                    .image !=
                                                                null
                                                            ? NetworkImage(APIURL
                                                                    .imageurl +
                                                                // ignore: null_check_always_fails
                                                                notificationProvider
                                                                    .notificationlistData[
                                                                        index]
                                                                    .image!)
                                                            : AssetImage(
                                                                AppImages
                                                                    .welcomescreenillimagethree,
                                                              ) as ImageProvider,
                                                      ),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 65.w,
                                                            child: Text(
                                                                notificationProvider
                                                                    .notificationlistData[
                                                                        index]
                                                                    .title
                                                                    .toString(),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: AppHelper
                                                                        .themelight
                                                                    ? AppStyle
                                                                        .cardtitledark
                                                                    : AppStyle
                                                                        .cardtitle),
                                                          ),
                                                          SizedBox(
                                                            height: 0.4.h,
                                                          ),
                                                          SizedBox(
                                                            width: 65.w,
                                                            child: Text(
                                                              notificationProvider
                                                                  .notificationlistData[
                                                                      index]
                                                                  .subTitle
                                                                  .toString(),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppHelper
                                                                      .themelight
                                                                  ? AppStyle
                                                                      .cardsubtitledark
                                                                      .copyWith(
                                                                          fontSize: 14
                                                                              .sp)
                                                                  : AppStyle
                                                                      .cardsubtitle
                                                                      .copyWith(
                                                                          fontSize:
                                                                              14.sp),
                                                            ),
                                                          ),
                                                          Divider(),
                                                          Text(
                                                            Languages.of(
                                                                    context)!
                                                                .justNow,
                                                            style: AppHelper
                                                                    .themelight
                                                                ? AppStyle
                                                                    .cardtitledark
                                                                    .copyWith(
                                                                        fontSize: 13
                                                                            .sp)
                                                                : AppStyle
                                                                    .cardtitle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            13.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : NoDataFoundErrorScreens(
                                title: Languages.of(context)!.nodatafound),
                      ],
                    ),
                  )
                : Center(
                    child: LoaderScreen(),
                  ),
          );
        })));
  }

  _dialogBuilder(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Languages.of(context)!.alert),
          content: Text(Languages.of(context)!.deletealertnmsg),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(Languages.of(context)!.no),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(Languages.of(context)!.yes),
              onPressed: () {
                //  delete(id);
              },
            ),
          ],
        );
      },
    );
  }
}
