import 'dart:convert';
import 'package:alpersonalcoachingapp/model/DietPlanModel.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../api/api.dart';
import '../../../api/apphelper.dart';
import '../../../localization/Language/languages.dart';
import '../../../utils/appColors.dart';
import '../../../utils/appbarforall.dart';
import '../../../utils/appstyle.dart';

class IngredientScreen extends StatefulWidget {
  final int id;
  final int index;
  final IngradientList datas;

  IngredientScreen(
      {Key? key, required this.id, required this.index, required this.datas})
      : super(key: key);

  @override
  _IngredientScreenState createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  Map<String, dynamic> fetched_data = {
    'Current Meal': '',
    'Calorie': '',
    'Protein': '',
    'Fat': '',
    'Carbohydrates': '',
    'optionalIngredients_list': []
  };
  bool datanotfound = false;
  bool datanotfoundStatus = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchOptionalIngredientList() async {
    print("dfgkjdfhg ${widget.id}");
    final url = '${APIURL.ROOT}/api/diet-ingradients/${widget.id}';
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        int length_of_optionalIngredients = data['data']['ingradientList']
                [widget.index]['optionalIngardientList']
            .length;
        print("fglkhjgf  ${widget.index}  " +
            length_of_optionalIngredients.toString());

        fetched_data['Current Meal'] = data['data']['ingradientList']
            [widget.index]['ingradientDetail']['title'];
        fetched_data['Calorie'] = data['data']['ingradientList'][widget.index]
            ['ingradientDetail']['calorie'];
        fetched_data['Protein'] = data['data']['ingradientList'][widget.index]
            ['ingradientDetail']['protein'];
        fetched_data['Fat'] = data['data']['ingradientList'][widget.index]
            ['ingradientDetail']['fat'];
        fetched_data['Carbohydrates'] = data['data']['ingradientList']
            [widget.index]['ingradientDetail']['carbohydrate'];
        fetched_data['optionalIngredients_list'] = [];

        for (int i = 0; i < length_of_optionalIngredients; i++) {
          fetched_data['optionalIngredients_list'].add([
            data['data']['ingradientList'][widget.index]
                ['optionalIngardientList'][i]['ingradientData']['title'],
            data['data']['ingradientList'][widget.index]
                ['optionalIngardientList'][i]['ingradientData']['calorie'],
            data['data']['ingradientList'][widget.index]
                ['optionalIngardientList'][i]['ingradientData']['protein'],
            data['data']['ingradientList'][widget.index]
                ['optionalIngardientList'][i]['ingradientData']['fat'],
            data['data']['ingradientList'][widget.index]
                ['optionalIngardientList'][i]['ingradientData']['carbohydrate']
          ]);
        }

        setState(() {
          print("dsfjkhgkjhg");
          //fetched_data;
          datanotfound = true;
        });
      } else {
        setState(() {
          datanotfoundStatus = true;
        });
        throw Exception('Failed to load optional ingredient list');
      }
    } catch (e) {
      setState(() {
        datanotfoundStatus = true;
      });
      print('Error fetching optional ingredient list: $e');
    }
  }

  double getData(String amount, String quantity) {
    double value = double.parse(amount) / 100 * double.parse(quantity);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    print("dfgkjdfhg ${widget.datas.optionalIngardientList!.length}");
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.optionalIn,
          )),
      body: widget.datas != null
          ? SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.sp, left: 16.sp, right: 16.sp, bottom: 16.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: widget.datas.optionalIngardientList!.isNotEmpty
                          ? ListView.builder(
                              itemCount:
                                  widget.datas.optionalIngardientList!.length,
                              itemBuilder: (context, index) {
                                final data =
                                    widget.datas.optionalIngardientList![index];
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).cardTheme.color,
                                        borderRadius:
                                            BorderRadius.circular(3.w),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                data.ingradientData!.title
                                                        .toString() ??
                                                    "",
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark
                                                        .copyWith(
                                                            fontSize: 14.sp,
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontWeight:
                                                                FontWeight.w200)
                                                    : AppStyle
                                                        .cardtitle
                                                        .copyWith(
                                                            fontSize: 14.sp,
                                                            color: AppColors
                                                                .blackColor)),
                                            SizedBox(
                                              height: 10.sp,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Languages.of(context)!
                                                      .quantity,
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle.cardtitle
                                                          .copyWith(
                                                          color: AppColors
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "${double.parse(data.optionalIngredientQty.toString()).toStringAsFixed(2) ?? '0'} g",
                                                  // "${double.parse(data.optionalIngredientQty.toString())} ",
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle
                                                          .cardtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Languages.of(context)!
                                                      .calorie,
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle.cardtitle
                                                          .copyWith(
                                                          color: AppColors
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  " ${getData(data.ingradientData!.calorie.toString() ?? '0', data.optionalIngredientQty.toString() ?? '0').toStringAsFixed(2)} kcal",
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle
                                                          .cardtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  Languages.of(context)!
                                                          .protien +
                                                      ". ${getData(data.ingradientData!.protein.toString() ?? '0', data.optionalIngredientQty.toString() ?? '0').toStringAsFixed(2)} g",
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle
                                                          .cardtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp),
                                                ),
                                                Text(
                                                  Languages.of(context)!.fat +
                                                      ". ${getData(data.ingradientData!.fat.toString() ?? '0', data.optionalIngredientQty.toString() ?? '0').toStringAsFixed(2)} g",
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle
                                                          .cardtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp),
                                                ),
                                                Text(
                                                  Languages.of(context)!
                                                          .carbohydrate +
                                                      ". ${getData(data.ingradientData!.carbohydrate.toString() ?? '0', data.optionalIngredientQty.toString() ?? '0').toStringAsFixed(2)} g",
                                                  style: AppHelper.themelight
                                                      ? AppStyle.cardtitledark
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolorYellow,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp)
                                                      : AppStyle
                                                          .cardtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primarycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.sp,
                                    )
                                  ],
                                );
                              },
                            )
                          : NoDataFoundErrorScreens(
                              title: Languages.of(context)!.nodatafound),
                    ),
                  ],
                ),
              ),
            )
          : LoaderScreennew(),
    );
  }
}
