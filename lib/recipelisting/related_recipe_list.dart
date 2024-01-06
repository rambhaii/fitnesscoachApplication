import 'dart:convert';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/releated_recipe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../api/api.dart';
import '../api/apphelper.dart';
import '../localization/Language/languages.dart';
import '../model/RelatedRecipe.dart';
import '../utils/appColors.dart';
import '../utils/appbarforall.dart';
import '../utils/appstyle.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class releated_recipe_list extends StatefulWidget {
  final String title;
  final int id;
  releated_recipe_list({super.key, required this.title, required this.id});

  @override
  State<releated_recipe_list> createState() => _releated_recipe_listState();
}

class _releated_recipe_listState extends State<releated_recipe_list> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  bool dataNotfond = false;
  bool dataNotfondstatus = false;

  List<RelatedRecipe> fetched_data = [];

  Future<void> fetchData() async
   {
    final url ='${APIURL.ROOT}/api/diet-ingradients/relatedrecipe/${widget.id}';
    try {
      final response = await http.get(Uri.parse(url));
      
     
      if (response.statusCode == 200) 
      {
        Map<String, dynamic> jsonResponse = json.decode(response.body);

        List<RelatedRecipe> recipelist = (jsonResponse['data'] as List)
            .map((data) => RelatedRecipe.fromJson(data))
            .toList();

        setState(()
         {
          dataNotfond = true;
          fetched_data.addAll(recipelist);
        });
       } 
       else {
        setState(()
         {
          dataNotfondstatus = true;
        });
        throw Exception('Failed to load optional ingredient list');
      }
    } catch (e) {
      setState(() {
        dataNotfondstatus = true;
      });
      print('Error fetching optional ingredient list: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(fetched_data.length);
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: widget.title.toString() ?? ' ',
          )),
      body: SafeArea(
        child: dataNotfond
            ? fetched_data.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: fetched_data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 20.sp, right: 20.sp, top: 10.sp),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => releated_recipe(
                                        id: widget.id ?? 0,
                                        title: "Releated Recipe",
                                        recipe_title: fetched_data[index].title,
                                        shortDescription: fetched_data[index]
                                            .shortDescription,
                                        prepareTime:
                                            fetched_data[index].prepareTime,
                                        cookTime: fetched_data[index].cookTime,
                                        serving: fetched_data[index].serving,
                                        calorie: fetched_data[index].calorie,
                                        protein: fetched_data[index].protein,
                                        fat: fetched_data[index].fat,
                                        /*carbohydrate: fetched_data[index].,*/ recipeVideo:
                                            fetched_data[index].recipeVideo,
                                        ingradients:
                                            fetched_data[index].ingradients,
                                        cookingSteps:
                                            fetched_data[index].cookingSteps,
                                      )),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor
                                    : AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : AppColors.primarycolor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: .5,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.w),
                                    bottomLeft: Radius.circular(8.w),
                                    bottomRight: Radius.circular(4.w),
                                    topRight: Radius.circular(4.w))),
                            height: 40.sp,
                            width: 1.sp,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topLeft,
                              children: [
                                Positioned(
                                  top: 1.h,
                                  left: -4.w,
                                  child: Container(
                                    height: 10.h,
                                    width: 10.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.appcardColor,
                                        image: DecorationImage(
                                            image: fetched_data[index]
                                                    .recipeimage[0]["image"]
                                                    .isEmpty
                                                ? AssetImage(
                                                    AppImages.meat,
                                                  )
                                                : NetworkImage(
                                                        "https://api.halsogourmet.com/" +
                                                            fetched_data[index]
                                                                    .recipeimage[
                                                                0]["image"])
                                                    as ImageProvider,
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.appcardColor,
                                            blurRadius: 5,
                                          ),
                                        ]),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        height: 12.h,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.5.h,
                                              bottom: 1.h,
                                              left: 1.h,
                                              right: 1.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        fetched_data[index]
                                                                .title ??
                                                            "",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppStyle
                                                            .cardtitle
                                                            .copyWith(
                                                                fontSize: 16.sp,
                                                                color: index %
                                                                            2 ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black)),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Servering",
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .cardsubtitledark
                                                            : AppStyle
                                                                .cardsubtitle,
                                                      ),
                                                      Text(
                                                        "${fetched_data[index].serving}",
                                                        style: AppStyle
                                                            .cardtitle
                                                            .copyWith(
                                                                fontSize: 14.sp,
                                                                color: index %
                                                                            2 ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 4.w,
                                                  ),
                                                  Container(
                                                    height: 2.5.h,
                                                    width: .5.w,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Tillagningstid",
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .cardsubtitledark
                                                            : AppStyle
                                                                .cardsubtitle,
                                                      ),
                                                      Text(
                                                        " ${((int.parse(fetched_data[index].prepareTime) + int.parse(fetched_data[index].cookTime.toString())).toString())} min",
                                                        style: AppStyle
                                                            .cardtitle
                                                            .copyWith(
                                                                fontSize: 14.sp,
                                                                color: index %
                                                                            2 ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : NoDataFoundErrorScreens(
                    title: Languages.of(context)!.nodatafound)
            : dataNotfondstatus
                ? NoDataFoundErrorScreens(
                    title: Languages.of(context)!.nodatafound)
                : LoaderScreennew(),
      ),
    );
  }
}
