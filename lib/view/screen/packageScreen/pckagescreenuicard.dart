import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PackagescreencardWidgetUI extends StatelessWidget {
  final String title;
  final String price;
  final bool showBadge;
  final List<dynamic> features;
  final Color iconColor;
  final String description;
  final Function() getPlan;

  const PackagescreencardWidgetUI(
      {Key? key,
      required this.title,
      required this.price,
      required this.getPlan,
      this.showBadge = false,
      required this.features,
      this.description = '',
      this.iconColor = AppColors.primarycolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(5.w),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 218, 215, 215).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showBadge ? PopularBadge() : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Column(
                      children: [
                        Text(
                          '\$$price',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primarycolor),
                        ),
                        Text(
                          Languages.of(context)!.month,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primarycolor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: Icon(
                  Icons.stars,
                  color: iconColor,
                  size: 6.h,
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark.copyWith(
                          fontSize: 20.sp,
                          color: AppColors.primarycolor,
                        )
                      : AppStyle.cardtitle.copyWith(
                          fontSize: 20.sp,
                          color: AppColors.primarycolor,
                        ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 5.w),
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppHelper.themelight
                            ? Colors.white
                            : AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.only(top: 1.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.cyan]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: features.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColors.primarycolor,
                                    child: Icon(Icons.done_rounded),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Text(
                                    features[index]['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        //fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      child: InkWell(
                        onTap: getPlan,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 6.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primarycolorYellow),
                          child: Center(
                            child: Text(
                              Languages.of(context)!.getPlan,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PopularBadge extends StatelessWidget {
  const PopularBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      height: 3.h,
      width: 14.h,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          Languages.of(context)!.popularPlan,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
