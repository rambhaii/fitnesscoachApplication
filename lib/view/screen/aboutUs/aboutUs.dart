import 'dart:convert';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../api/api.dart';
import '../../../api/apphelper.dart';
import '../../../localization/Language/languages.dart';
import '../../../utils/appbarforall.dart';
import 'package:http/http.dart' as http;

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String message = '';
  Future fetchdata() async {
    final response = await http.get(Uri.parse(APIURL.aboutus), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}',
    });
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      return res;
    } else {
      print('Data Loading Failed...');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.aboutus,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          AppHelper.themelight
              ? Image.asset(
                  AppImages.blacklogo,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  AppImages.logo,
                  fit: BoxFit.fill,
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Languages.of(context)!.aboutus,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppHelper.themelight
                    ? Colors.white
                    : AppColors.primarycolor,
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          FutureBuilder(
            future: fetchdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final res = snapshot.data;
                final data = res['data'] as List;
                print('objects ${res['data']}');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: AppHelper.themelight
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            data[0]['title'].toString(),
                            style: TextStyle(
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 1.h,),
                          Text(
                            data[0]['note'].toString(),
                            style: TextStyle(
                                color: AppColors.primarycolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 1),
                            child: Text(
                              data[0]['description'].toString(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppHelper.themelight
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child:LoaderScreennew(),
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
