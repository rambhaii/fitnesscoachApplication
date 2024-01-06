import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List<String> imgList = ['https://ibb.co/wNwXF6b'];

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3, //imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: () {},
          child: Image.asset(
            AppImages.banner,
            fit: BoxFit.fill,
          ),
          //  CachedNetworkImage(
          //   //imageUrl: imgList[itemIndex],
          //   imageUrl: imgList[itemIndex],
          //   width: 100.w,
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => LoaderScreennew(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 1,
        initialPage: 0,
        // enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        //  autoPlayInterval: Duration(seconds: 3),
        // autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
    );
  }
}
