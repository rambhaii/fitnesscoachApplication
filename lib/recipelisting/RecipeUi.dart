import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/main.dart';
import 'package:alpersonalcoachingapp/provider/Recipeprovider.dart';
import 'package:alpersonalcoachingapp/recipelisting/BeafScreen.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/utils/nointernetconnection.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllRecipeScreenActivity extends StatefulWidget {
  const AllRecipeScreenActivity({super.key});

  @override
  State<AllRecipeScreenActivity> createState() =>
      _AllRecipeScreenActivityState();
}

class _AllRecipeScreenActivityState extends State<AllRecipeScreenActivity> {
  RecipeProvider recipeProvider = RecipeProvider();
  TextEditingController sercheditcontroler = new TextEditingController();
  String searchString = '';
  bool searchshow = false;
  bool filter = false;
  bool showpop = false;
  late ScrollController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

    filter = false;

    getalldata();
    _controller = ScrollController()..addListener(_loadMore);

    super.initState();
  }

  void _loadMore() async {
    await recipeProvider.loadMoreallrecipe(filter.toString());
  }

  getalldata() async {
    await recipeProvider.allrecipelist(1, filter.toString(), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(title: Languages.of(context)!.releatedRecipe),
      ),
      body: Provider.of<InternetConnectionStatus>(context) ==
              InternetConnectionStatus.disconnected
          ? InternetNotAvailable()
          : Consumer<RecipeProvider>(
              builder: (context, recipeProvider, child) {
                return Stack(clipBehavior: Clip.none, children: [
                  SingleChildScrollView(
                    controller: _controller,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10, right: 5, bottom: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(1.h)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 2.w),
                                      child: TextField(
                                        controller: sercheditcontroler,
                                        onChanged: ((value) async {
                                         
                                          recipeProvider.isFirstdatafound =  true;
                                          recipeProvider.datanotfound = false;
                                          await recipeProvider.allrecipelist(
                                              1,
                                              filter.toString(),
                                              sercheditcontroler.text);
                                        }),
                                        decoration: InputDecoration(
                                            isDense: true,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  searchshow = false;
                                                  sercheditcontroler.clear();
                                                  searchString = '';
                                                });
                                              },
                                            ),
                                            hintText:
                                                Languages.of(context)!.search,
                                            hintStyle: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Amazon',
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          !recipeProvider.isFirstdatafound
                              ? recipeProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                      title: Languages.of(context)!.nodatafound,
                                    )
                                  : BeafUI(
                                      recipedata: recipeProvider.recipeList,
                                      type: "foodtype",
                                      searchString: searchString,
                                      callback: (value) {},
                                    )
                              : LoaderScreen(),
                          SizedBox(
                            height: 3.h,
                          ),
                          if (recipeProvider.isLoadMoreRunning)
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ]);
              },
            ),
    );
  }
}
