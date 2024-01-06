import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/api/likeapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/model/RecipeModel.dart';
import 'package:alpersonalcoachingapp/recipelisting/recipedtails.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/releated_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../page_routes/routes.dart';

class BeafUI extends StatefulWidget {
  final List<RecipeData>? recipedata;
  final String type;
  final String searchString;
  final Function? callback;

  const BeafUI({
    Key? key,
    required this.recipedata,
    required this.type,
    required this.searchString,
    this.callback,
  }) : super(key: key);

  @override
  State<BeafUI> createState() => _BeafUIState();
}

class _BeafUIState extends State<BeafUI> {
  List<RecipeData> bottomlist = [];
  bool datashow = false;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future fetchdata() async {
    bottomlist = [];
    for (int i = 0; i < widget.recipedata!.length; i++) {
      if (widget.recipedata![i].title!
          .toLowerCase()
          .contains(widget.searchString.toLowerCase())) {
        bottomlist.add(widget.recipedata![i]);
      }
    }
    datashow = true;
    return bottomlist;
  }

  bool isPressed = false;
  bool isPressedLike = false;

  bool showpop = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchdata(),
        builder: (context, snapshot) {
          if (bottomlist.isEmpty)
            return NoDataFoundErrorScreens(
              height: 50.h,
              title: Languages.of(context)!.nodatafound,
            );

          if (snapshot.hasData && datashow) {
            return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  ListView.builder(
                    itemCount: bottomlist.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 6.w, right: 6.w, top: 10, bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeDetails(
                                      id: bottomlist[index].id ?? 0,
                                      title:
                                          bottomlist[index].title.toString())),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? AppHelper.themelight
                                        ? AppColors.primarycolorYellow
                                        : Colors.black
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
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: bottomlist[index]
                                                    .recipeimage!
                                                    .isEmpty
                                                ? AssetImage(
                                                    AppImages.meat,
                                                  )
                                                : NetworkImage(
                                                        "https://api.halsogourmet.com/" +
                                                            bottomlist[index]
                                                                .recipeimage![0]
                                                                .image!)
                                                    as ImageProvider,
                                            fit: BoxFit.cover),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
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
                                                      bottomlist[index].title!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Servering",
                                                      ),
                                                      Text(
                                                        bottomlist[index]
                                                            .serving
                                                            .toString(),
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
                                                      ),
                                                      Text(
                                                        " ${((int.parse(bottomlist[index].prepareTime.toString()) + int.parse(bottomlist[index].cookTime.toString())).toString())} min",
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
                    },
                  ),
                ]);
          } else {
            return LoaderScreen();
          }
        });
  }
}
