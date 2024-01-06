import 'dart:convert';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/RecipeModel.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/Chat/chatsapi.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/VideoPlay.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../api/api.dart';
import '../../../api/apphelper.dart';
import '../../../localization/Language/languages.dart';
import '../../../utils/appColors.dart';
import '../../../utils/appbarforall.dart';
import '../../../utils/appstyle.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeDetails extends StatefulWidget {
  final int id;
  final String title;

  RecipeDetails({super.key, required this.id, required this.title});

  @override
  State<RecipeDetails> createState() => _releated_recipeState();
}

class _releated_recipeState extends State<RecipeDetails>
    with TickerProviderStateMixin {
  late YoutubePlayerController _controller;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _cookingStepsController;
  late Animation<double> _cookingStepsAnimation;
  late AnimationController _energyStepsController;
  late Animation<double> _energyStepsAnimation;

  String videoId = '';
  bool cookingStepsVisibility = false;
  bool ingradiants_visibility = false;
  bool dataNotfond = false;
  bool dataNotfound = false;
  bool isfullScreen = false;
  bool EnergyStepsVisibility = true;
  Map<String, dynamic> fetched_data = {
    'title': '',
    'shortDescription': '',
    'prepareTime': '',
    'cookTime': '',
    'serving': '',
    'calorie': '',
    'protein': '',
    'fat': '',
    'carbohydrate': '',
    'recipeVideo': '',
    'cookingSteps': [],
    'ingradients': [],
    'recipeimage': [],
  };

  RecipeModel recipeModel = RecipeModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_releated_recipe_data();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.5).animate(_animationController);

    _cookingStepsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _cookingStepsAnimation =
        Tween<double>(begin: 0.0, end: 1.5).animate(_cookingStepsController);

    _energyStepsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _energyStepsAnimation =
        Tween<double>(begin: 0.0, end: 1.5).animate(_energyStepsController);

    print("vedio " + videoId.toString());
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
          mute: false, autoPlay: true, loop: true, enableCaption: false),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cookingStepsController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      ingradiants_visibility = !ingradiants_visibility;
      if (ingradiants_visibility) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _toggleCookingStepsVisibility() {
    setState(() {
      cookingStepsVisibility = !cookingStepsVisibility;
      if (cookingStepsVisibility) {
        _cookingStepsController.forward();
      } else {
        _cookingStepsController.reverse();
      }
    });
  }

  void _toggleEnergyingStepsVisibility() {
    setState(() {
      EnergyStepsVisibility = !EnergyStepsVisibility;
      if (EnergyStepsVisibility) {
        _energyStepsController.forward();
      } else {
        _energyStepsController.reverse();
      }
    });
  }

  List<CookingSteps> cookingSteps = [];
  List<Ingradients> ingradients = [];

  Future<void> fetch_releated_recipe_data() async {
    final url = '${APIURL.MYHOME}/fetch/select-recipe';
    try {
      var data = {
        "recipeId": [widget.id],
      };
      print(" dhsghdfgdghjd${data}");

      ServiceWithHeaderWithbody service = ServiceWithHeaderWithbody(url, data);

      var response = await service.postdatawithoutbody();

      // print("fgkdfhgkdfhkghjfdfgdfg  ${response['data']}");

      recipeModel = RecipeModel.fromJson(response);

      if (response['status'] == "success") {
        print("dfdfgfdgd  ${recipeModel.data!.length}");

        for (int i = 0; i < recipeModel.data!.length; i++) {
          fetched_data['title'] = recipeModel.data![i].title;
          fetched_data['shortDescription'] =
              recipeModel.data![i].shortDescription;

          fetched_data['prepareTime'] = recipeModel.data![i].prepareTime;
          fetched_data['cookTime'] = recipeModel.data![i].cookTime;
          fetched_data['serving'] = recipeModel.data![i].serving;
          fetched_data['calorie'] = recipeModel.data![i].calorie;
          fetched_data['protein'] = recipeModel.data![i].protein;
          fetched_data['carbohydrate'] = recipeModel.data![i].carbohydrate;

          fetched_data['fat'] = recipeModel.data![i].fat;
          fetched_data['recipeVideo'] = recipeModel.data![i].recipeVideo;
          fetched_data['cookingSteps'] = recipeModel.data![i].cookingSteps;
          fetched_data['ingradients'] = recipeModel.data![i].ingradients;
          fetched_data['recipeimage'] = recipeModel.data![i].recipeimage;
          cookingSteps = recipeModel.data![i].cookingSteps!;
          ingradients = recipeModel.data![i].ingradients!;
        }
        videoId = YoutubePlayer.convertUrlToId(fetched_data['recipeVideo'])!;
        setState(() {
          dataNotfond = true;
          fetched_data;
          videoId;
        });
      } else {
        setState(() {
          print("fkjhg");
          dataNotfound = true;
        });
        throw Exception('Failed to load optional ingredient list');
      }
    } catch (e) {
      print('Error fetching optional ingredient list: $e');
    }
  }

  double height = 25.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: widget.title.toString() ?? ' ',
          )),
      body: dataNotfond
          ? SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: height,
                      child: PalyVideoYoutubeScreen(
                        url: videoId!,
                        callback: (value) {
                          if (value) {
                            setState(() {
                              isfullScreen = true;
                              height = 75.h;
                            });
                          } else {
                            setState(() {
                              height = 25.h;
                              isfullScreen = false;
                            });
                          }
                        },
                      )),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                top: 10.sp,
                                bottom: 20.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primarycolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(1.w),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        fetched_data['title'],
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16)
                                            : AppStyle.cardtitle.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .local_fire_department_rounded,
                                                size: 25,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                " ${fetched_data['calorie']} Kcal",
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark.copyWith(
                                                        color: AppColors
                                                            .primarycolorYellow,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp)
                                                    : AppStyle.cardtitle
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timer_outlined,
                                                size: 25,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                " ${int.parse(fetched_data['prepareTime']) + int.parse(fetched_data['cookTime'])} min",
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark.copyWith(
                                                        color: AppColors
                                                            .primarycolorYellow,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp)
                                                    : AppStyle.cardtitle
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.self_improvement_rounded,
                                                size: 28,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                " ${fetched_data['serving']}",
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark.copyWith(
                                                        color: AppColors
                                                            .primarycolorYellow,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp)
                                                    : AppStyle.cardtitle
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.sp),
                                              ),
                                              Text(
                                                " " +
                                                    Languages.of(context)!
                                                        .servings +
                                                    "",
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark
                                                        .copyWith(
                                                            color: AppColors
                                                                .primarycolorYellow,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14.sp)
                                                    : AppStyle.cardtitle
                                                        .copyWith(
                                                        color: AppColors
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                bottom: 8.sp,
                              ),
                              child: GestureDetector(
                                onTap: _toggleEnergyingStepsVisibility,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Languages.of(context)!.energydesc,
                                      style: AppHelper.themelight
                                          ? AppStyle.cardtitledark.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)
                                          : AppStyle.cardtitle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                    ),
                                    AnimatedBuilder(
                                      animation: _energyStepsAnimation,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _energyStepsAnimation.value *
                                              6.28,
                                          child: Icon(
                                            EnergyStepsVisibility
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_down,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: EnergyStepsVisibility,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardTheme.color,
                                borderRadius: BorderRadius.circular(3.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          Languages.of(context)!.calorie + "",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                        ),
                                        Spacer(),
                                        Text(
                                          " ${fetched_data['calorie']} Kcal",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.primarycolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Kolhydrater" + "",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                        ),
                                        Spacer(),
                                        Text(
                                          " ${fetched_data['carbohydrate'] ?? '0'}"
                                          "g",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.primarycolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Languages.of(context)!.fat + "",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                        ),
                                        Spacer(),
                                        Text(
                                          " ${fetched_data['fat']}"
                                          "g",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.primarycolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Languages.of(context)!.protien + "",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                        ),
                                        Spacer(),
                                        Text(
                                          " ${fetched_data['protein']}"
                                          "g",
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark.copyWith(
                                                  color: AppColors
                                                      .primarycolorYellow,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp)
                                              : AppStyle.cardtitle.copyWith(
                                                  color: AppColors.primarycolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                bottom: 8.sp,
                              ),
                              child: GestureDetector(
                                onTap: _toggleCookingStepsVisibility,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Languages.of(context)!.cookingStep,
                                      style: AppHelper.themelight
                                          ? AppStyle.cardtitledark.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)
                                          : AppStyle.cardtitle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                    ),
                                    AnimatedBuilder(
                                      animation: _cookingStepsAnimation,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _cookingStepsAnimation.value *
                                              6.28,
                                          child: Icon(
                                            cookingStepsVisibility
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_down,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        cookingSteps.isNotEmpty
                            ? Visibility(
                                visible: cookingStepsVisibility,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          20,
                                      right: MediaQuery.of(context).size.width /
                                          20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardTheme.color,
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: cookingSteps.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 15.w,
                                                  child: Text(
                                                    "Step ${cookingSteps[index].step}: ",
                                                    style: AppHelper.themelight
                                                        ? AppStyle.cardtitledark
                                                            .copyWith(
                                                                color: AppColors
                                                                    .greyColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14.sp)
                                                        : AppStyle.cardtitle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    14.sp),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.4,
                                                    child: Text(
                                                      "  ${cookingSteps[index].description} ",
                                                      style: AppHelper.themelight
                                                          ? AppStyle.cardtitledark
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .greyColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14
                                                                      .sp)
                                                          : AppStyle.cardtitle
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      14.sp),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Center(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5, bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20,
                                right: MediaQuery.of(context).size.width / 20,
                                bottom: 8.sp,
                              ),
                              child: GestureDetector(
                                onTap: _toggleVisibility,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Languages.of(context)!.ingradients,
                                      style: AppHelper.themelight
                                          ? AppStyle.cardtitledark.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)
                                          : AppStyle.cardtitle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                    ),
                                    AnimatedBuilder(
                                      animation: _animation,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle: _animation.value * 6.28,
                                          child: Icon(
                                            ingradiants_visibility
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_down,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        ingradients.isNotEmpty
                            ? Visibility(
                                visible: ingradiants_visibility,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          20,
                                      right: MediaQuery.of(context).size.width /
                                          20,
                                      bottom: 16.sp),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardTheme.color,
                                      borderRadius: BorderRadius.circular(3.w),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: ingradients.length,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.01,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 20.w,
                                                        child: Text(
                                                          " ${ingradients[index].amount} g",
                                                          style: AppHelper
                                                                  .themelight
                                                              ? AppStyle.cardtitledark.copyWith(
                                                                  color: AppColors
                                                                      .greyColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      15.sp)
                                                              : AppStyle.cardtitle.copyWith(
                                                                  color: AppColors
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      15.sp),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${ingradients[index].ingradient!.title}",
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle.cardtitledark.copyWith(
                                                                color: AppColors
                                                                    .greyColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14.sp)
                                                            : AppStyle.cardtitle.copyWith(
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    14.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Center(),
                      ],
                    ),
                  )
                ],
              ),
            )
          : dataNotfound
              ? NoDataFoundErrorScreens(
                  title: Languages.of(context)!.nodatafound,
                )
              : LoaderScreennew(),
    );
  }
}
