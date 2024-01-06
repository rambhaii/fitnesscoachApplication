import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/model/GallaryImgModel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/view/screen/GallarySCreens/ZoomInZoomOutImage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GallaryList extends StatefulWidget {
  final GallaryImages? imagefiles;

  const GallaryList({super.key, required this.imagefiles});

  @override
  State<GallaryList> createState() => _clickpicks();
}

class _clickpicks extends State<GallaryList> {
  @override
  Widget build(BuildContext context) {
    print("kjfdhgkj  " +
        APIURL.imageurl +
        widget.imagefiles!.clientImage1.toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ZoomInZoomOutImage(
                          image: widget.imagefiles!.clientImage1.toString())),
                );
              },
              child: widget.imagefiles!.clientImage1 != null
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        widget.imagefiles!.clientImage1!.isNotEmpty
                            ? Container(
                                height: 22.w,
                                width: 26.w,
                                decoration: BoxDecoration(
                                    color: AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(APIURL.imageurl +
                                            widget.imagefiles!.clientImage1!
                                                .toString())),
                                    borderRadius: BorderRadius.circular(1.w)),
                              )
                            : CircularProgressIndicator(),
                      ],
                    )
                  : Center(),
            ),
            widget.imagefiles!.clientImage2 != null
                ? Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 2.w),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ZoomInZoomOutImage(
                                          image: widget.imagefiles!.clientImage2
                                              .toString())),
                                );
                              },
                              child: Container(
                                height: 22.w,
                                width: 26.w,
                                decoration: BoxDecoration(
                                    color: AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(APIURL.imageurl +
                                            widget.imagefiles!.clientImage2!)),
                                    borderRadius: BorderRadius.circular(1.w)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(),
            widget.imagefiles!.clientImage3 != null
                ? Padding(
                    padding: EdgeInsets.only(left: 1.w, right: 2.w),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ZoomInZoomOutImage(
                                          image: widget.imagefiles!.clientImage3
                                              .toString())),
                                );
                              },
                              child: Container(
                                height: 22.w,
                                width: 26.w,
                                decoration: BoxDecoration(
                                    color: AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(APIURL.imageurl +
                                            widget.imagefiles!.clientImage3!)),
                                    borderRadius: BorderRadius.circular(1.w)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(),
          ],
        ),
      ],
    );
  }
}
