import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/favoriteScreen/components/favoriteScreenCardUI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteScreenActivity extends StatefulWidget {
  const FavoriteScreenActivity({super.key});

  @override
  State<FavoriteScreenActivity> createState() => _FavoriteScreenActivityState();
}

class _FavoriteScreenActivityState extends State<FavoriteScreenActivity> {
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return Scaffold(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarScreens(
                title: Languages.of(context)!.myfavorites,
              )),
          body: Padding(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 2.h, left: 2.w, right: 2.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: sercheditcontroler,
                        onChanged: ((value) {
                          setState(() {
                            searchString = sercheditcontroler.text;
                          });
                        }),
                        cursorColor: AppColors.primarycolor,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.greyColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.w),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.greyColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.w),
                                )),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.greyColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.w),
                                )),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: AppColors.primarycolor,
                              onPressed: () {
                                setState(() {
                                  sercheditcontroler.clear();
                                  searchString = '';
                                });
                              },
                            ),
                            hintText: 'favorite search',
                            hintStyle: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                    .copyWith(color: AppColors.greyColor)
                                : AppStyle.cardsubtitle
                                    .copyWith(color: AppColors.greyColor)),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: favoriteScreenCardUI(),
                            ),
                          );
                        })),
              ],
            ),
          ));
    });
  }
}
