import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/DietPlanModel.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coachmanfourscreenUI.dart';
import 'package:alpersonalcoachingapp/recipelisting/related_recipe_list.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/releated_recipe.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../page_routes/routes.dart';
import 'optional_ingredient_screen.dart';

class CoachmanfourScreenActivity extends StatefulWidget {
  final String title;
  final MealPlanList mealPlanList;
  const CoachmanfourScreenActivity(
      {super.key, required this.title, required this.mealPlanList});

  @override
  State<CoachmanfourScreenActivity> createState() =>
      _CoachmanfourScreenActivityState();
}

double getData(String calorie, String amount, String quantity) {
  double value =
      double.parse(calorie) / double.parse(amount) * double.parse(quantity);
  return value;
}

class _CoachmanfourScreenActivityState
    extends State<CoachmanfourScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: widget.title.toString(),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: widget.mealPlanList.dietPlanDetail != null
              ? Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 16.sp, right: 16.sp),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardTheme.color,
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Languages.of(context)!.releatedRecipe,
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                color: AppColors
                                                    .primarycolorYellow,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp)
                                            : AppStyle.cardtitle.copyWith(
                                                color: AppColors.primarycolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                      ),
                                      GestureDetector(
                                          onTap: () {

                                             Navigator.pushNamed(
                                                context, Routes.allRecipeScreenActivity,
                                               
                                                );
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           releated_recipe_list(
                                            //               id: widget
                                            //                       .mealPlanList
                                            //                       .dietPlanDetail!
                                            //                       .id ??
                                            //                   0,
                                            //               title: Languages.of(
                                            //                       context)!
                                            //                   .releatedRecipe)),
                                            // );
                                         
                                         
                                         
                                          },
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 20.sp,
                                              color: AppHelper.themelight
                                                  ? AppColors.primarycolorYellow
                                                  : AppColors.primarycolor))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
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
                                        " ${double.parse(widget.mealPlanList.dietPlanDetail?.calorie ?? '0').toStringAsFixed(2)} kcal",
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                color: AppColors
                                                    .primarycolorYellow,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp)
                                            : AppStyle.cardtitle.copyWith(
                                                color: AppColors.primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Kolhydrater",
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
                                        " ${double.parse(widget.mealPlanList.dietPlanDetail?.carbohydrate ?? '0').toStringAsFixed(2)} g",
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                color: AppColors
                                                    .primarycolorYellow,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp)
                                            : AppStyle.cardtitle.copyWith(
                                                color: AppColors.primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Fett",
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
                                        " ${double.parse(widget.mealPlanList.dietPlanDetail?.fat ?? '0').toStringAsFixed(2)} g",
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                color: AppColors
                                                    .primarycolorYellow,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp)
                                            : AppStyle.cardtitle.copyWith(
                                                color: AppColors.primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Protein",
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
                                        " ${double.parse(widget.mealPlanList.dietPlanDetail?.protein ?? '0').toStringAsFixed(2)} g",
                                        style: AppHelper.themelight
                                            ? AppStyle.cardtitledark.copyWith(
                                                color: AppColors
                                                    .primarycolorYellow,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp)
                                            : AppStyle.cardtitle.copyWith(
                                                color: AppColors.primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))),
                    widget.mealPlanList.dietPlanDetail != null
                        ? ListView.builder(
                            itemCount: widget.mealPlanList.dietPlanDetail!
                                .ingradientList!.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 2.h,
                                    left: 2.h,
                                    right: 2.h,
                                    bottom: 0.2.h),
                                child:
                                    widget
                                                .mealPlanList
                                                .dietPlanDetail!
                                                .ingradientList![index]
                                                .ingradientDetail !=
                                            null
                                        ? CoachmanfourUiScreenACtivity(
                                            title: widget
                                                .mealPlanList
                                                .dietPlanDetail!
                                                .ingradientList![index]
                                                .ingradientDetail!
                                                .title
                                                .toString(),
                                            subtitle: widget
                                                    .mealPlanList
                                                    .dietPlanDetail!
                                                    .ingradientList![index]
                                                    .quantity
                                                    .toString() +
                                                " g",
                                            kclamount:
                                                "   ${getData(widget.mealPlanList.dietPlanDetail!.ingradientList![index].ingradientDetail!.calorie.toString() ?? "0", widget.mealPlanList.dietPlanDetail!.ingradientList![index].ingradientDetail!.amount.toString() ?? "0", widget.mealPlanList.dietPlanDetail!.ingradientList![index].quantity.toString() ?? "0").toStringAsFixed(2)} kcal" ??
                                                    "0 kcal",
                                            optional_ingredient: () {
                                              print(
                                                  "jkhgrdjdfhkgjkdf ${widget.mealPlanList.dietPlanDetail!.ingradientList![index].optionalIngardientList!}");

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            IngredientScreen(
                                                              id: widget
                                                                      .mealPlanList
                                                                      .dietPlanDetail!
                                                                      .id ??
                                                                  0,
                                                              index: index,
                                                              datas: widget
                                                                  .mealPlanList
                                                                  .dietPlanDetail!
                                                                  .ingradientList![index],
                                                            )),
                                              );
                                            },
                                            onTap: () {},
                                          )
                                        : Center(),
                              );
                            })
                        : Container(),
                  ],
                )
              : NoDataFoundErrorScreens(
                  title: Languages.of(context)!.nodatafound,
                ),
        ),
      ),
    );
  }
}
