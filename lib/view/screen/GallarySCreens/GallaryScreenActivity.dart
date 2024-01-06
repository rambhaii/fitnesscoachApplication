import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/NotificationProvider.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/GallarySCreens/GallaryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:intl/intl.dart';


class GallaryScreenActivity extends StatefulWidget {
  const GallaryScreenActivity({super.key});

  @override
  State<GallaryScreenActivity> createState() => _GallaryScreenActivityState();
}

class _GallaryScreenActivityState extends State<GallaryScreenActivity> {
  NotificationProvider _dashboardProvider = NotificationProvider();
  String? date;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _dashboardProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    _dashboardProvider.getGallaryImages();
  }

  dateConverter(String myDate) {
    DateTime dt = DateTime.parse(myDate);

    final localTime = dt.toLocal();

    var inputDate = DateTime.parse(localTime.toString());
    var outputFormat = DateFormat('DD/MM/YYYY');
    var outputDate = outputFormat.format(inputDate);

    DateTime convertedDate =
        DateFormat("DD/MM/YYYY").parse(outputDate.toString());
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final dateToCheck = convertedDate;
    final checkDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
     if (checkDate == today)
      {
      date = Languages.of(context)!.today;
    } else if (checkDate == yesterday) {
      date = Languages.of(context)!.yesterday;
    } else if (checkDate == tomorrow) {
      date = Languages.of(context)!.tomarrow;
    } else {
      date = myDate;
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              title: Languages.of(context)!.gallary,
            )),
        body: Consumer<NotificationProvider>
        (
            builder: ((context, notificationProvider, child)
            {
          return notificationProvider.gallaryDatanotfound
              ? Padding(
                  padding: EdgeInsets.all(2.h),
                  child: notificationProvider.gallaryImagesListsData.isNotEmpty
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: notificationProvider
                              .gallaryImagesListsData.length,
                          itemBuilder: (context, index) {
                            final data = notificationProvider .gallaryImagesListsData[index];

                            return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      child: SizedBox(
                                        // height: 2.h,
                                        width: 50.w,
                                        //  decoration: BoxDecoration(color: AppColors.primarycolor),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            timeago.format(DateTime.parse(data.createdAt.toString())),
                                            style: AppHelper.themelight
                                                ? AppStyle.cardsubtitledark
                                                : AppStyle.cardsubtitle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    GallaryList(
                                      imagefiles: data,
                                    )
                                  ],
                                ));
                          })
                      : NoDataFoundErrorScreens(
                          title: Languages.of(context)!.nodatafound,
                        ),
                )
              : Center(
                  child: LoaderScreennew(),
                );
        })));
  }
}
