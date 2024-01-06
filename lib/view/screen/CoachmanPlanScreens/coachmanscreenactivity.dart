import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/DietPlanProvider.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coackmanscreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanScreenActivity extends StatefulWidget {
  const CoachmanScreenActivity({super.key});

  @override
  State<CoachmanScreenActivity> createState() => _CoachmanScreenActivityState();
}

class _CoachmanScreenActivityState extends State<CoachmanScreenActivity> {
  DietPlanProvider _dietPlanProvider = DietPlanProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _dietPlanProvider = Provider.of<DietPlanProvider>(context, listen: false);

    _dietPlanProvider.getDietPlan();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              title: Languages.of(context)!.dietPlan,
            )),
        body: Consumer<DietPlanProvider>(
            builder: ((context, dietPlanProvider, child) {
          return dietPlanProvider.datanotfound
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        dietPlanProvider.dietPlanModellist.isNotEmpty
                            ? ListView.builder(
                                itemCount:
                                    dietPlanProvider.dietPlanModellist.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 2.h,
                                        left: 2.h,
                                        right: 2.h,
                                        bottom: 0.2.h),
                                    child: CoachmanUiScreenACtivity(
                                      title: dietPlanProvider
                                          .dietPlanModellist[index].dietPlanName
                                          .toString(),
                                      icon: Icons.donut_large_sharp,
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            Routes.coachmantwoScreenActivity,
                                            arguments: {
                                              AppStringFile.title:
                                                  dietPlanProvider
                                                      .dietPlanModellist[index]
                                                      .dietPlanName
                                                      .toString(),
                                              AppStringFile.dietPlanModellist:
                                                  dietPlanProvider
                                                      .dietPlanModellist[index],
                                            });
                                      },
                                    ),
                                  );
                                })
                            : NoDataFoundErrorScreens(
                                title: Languages.of(context)!.nodatafound,
                              ),
                      ],
                    ),
                  ),
                )
              : Center(child: LoaderScreennew());
        })));
  }
}
