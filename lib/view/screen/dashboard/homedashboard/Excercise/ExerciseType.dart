import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/TrainingProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:alpersonalcoachingapp/utils/showExitPopup.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/NoDataFoundErrorScreens.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/ExerciseSubType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExerciseType extends StatefulWidget {
  const ExerciseType({super.key});

  @override
  State<ExerciseType> createState() => _ExerciseTypeState();
}

class _ExerciseTypeState extends State<ExerciseType> {
  TrainingProvider _trainingProvider = TrainingProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
    _trainingProvider = Provider.of<TrainingProvider>(context, listen: false);
    _trainingProvider.getTrainingType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarScreens(
          title: Languages.of(context)!.Trainingschedules,
        ),
      ),
      body: Consumer<TrainingProvider>(
        builder: ((context, trainingProvider, child) {
          return trainingProvider.datanotfound
              ? Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: trainingProvider.trainingTypelist.isNotEmpty
                      ? ListView.builder(
                          itemCount: trainingProvider.trainingTypelist.length,
                          itemBuilder: (context, position) {
                            final data =
                                trainingProvider.trainingTypelist[position];

                            print("fdogujiotu" +
                                data.trainingPlanName.toString());

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 700),
                                    child: ExerciseSubType(
                                      trainingType: trainingProvider
                                          .trainingTypelist[position],
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        data.trainingPlanName.toString(),
                                        style: AppHelper.themelight
                                            ? AppStyle.cardsubtitledark
                                            : AppStyle.cardsubtitle,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 700),
                                            child: ExerciseSubType(
                                              trainingType: trainingProvider
                                                  .trainingTypelist[position],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        //size: 2.5.h,
                                        color: AppHelper.themelight
                                            ? AppColors.primarycolorYellow
                                            : AppColors.primarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : NoDataFoundErrorScreens(
                          title: Languages.of(context)!.nodatafound,
                        ),
                )
              : Center(
                  child: LoaderScreennew(),
                );
        }),
      ),
    );
  }
}
