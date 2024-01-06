import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeSearchScreenActivityCard extends StatefulWidget {
  const HomeSearchScreenActivityCard({super.key});

  @override
  State<HomeSearchScreenActivityCard> createState() =>
      _HomeSearchScreenActivityCardState();
}

class _HomeSearchScreenActivityCardState
    extends State<HomeSearchScreenActivityCard> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
        child: Row(
          children: [
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.welcomescreenillimagesec))),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                            "Fitness training balances five elements of good health. Make sure your routine includes aerobic fitness, strength training, core exercises,",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                    .copyWith(fontSize: 15.sp)
                                : AppStyle.cardtitle.copyWith(fontSize: 15.sp)),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () async {},
                          child: favorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                )),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primarycolor,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text("4.5 (35 reviews)",
                              style: AppHelper.themelight
                                  ? AppStyle.cardtitledark
                                      .copyWith(fontSize: 14.sp)
                                  : AppStyle.cardtitle
                                      .copyWith(fontSize: 14.sp))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primarycolor,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Swedish",
                            style: AppStyle.onbaordtitle.copyWith(
                                color: AppColors.greyColor, fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
