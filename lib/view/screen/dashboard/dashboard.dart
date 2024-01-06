import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/DashBoardProvider.dart';
import 'package:alpersonalcoachingapp/provider/DietPlanProvider.dart';
import 'package:alpersonalcoachingapp/provider/TrainingProvider.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/showExitPopup.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatScreen.dart';
import 'package:alpersonalcoachingapp/view/Chat/MessageGroupingWithTimeStamp.dart';
import 'package:alpersonalcoachingapp/view/Chat/chatsapi.dart';
import 'package:alpersonalcoachingapp/view/Chat/check.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/coachmanscreenactivity.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/ExerciseType.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/homedashboard.dart';
import 'package:alpersonalcoachingapp/view/screen/drawer/menubar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ProfileScreens/profilescreenActivity.dart';

class DashBoardScreenActivity extends StatefulWidget {
  const DashBoardScreenActivity({super.key});

  @override
  State<DashBoardScreenActivity> createState() =>
      _DashBoardScreenActivityState();
}

class _DashBoardScreenActivityState extends State<DashBoardScreenActivity> {
  int _currentIndex = 0;

  bool isHomePageSelected = true;
  final _key = GlobalKey<ScaffoldState>();
  List tabs = [];
  bool? isUpdated;

  onBottomIconPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    fetdata();
    super.initState();
    creatChateRoom();
    checkElapsedDays();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future creatChateRoom() async {
    var data = {
      "trainerId": AppHelper.trainerId.toString(),
    };
    print(
        " dhsghdfgdghjd${AppHelper.trainerId.toString()} ${AppHelper.userid}");

    chatsapi responsedata = chatsapi(data);

    final response = await responsedata.createchatRoom();

    print("fgkdfhgkdfhkghjf  dfgdfg  ${response}");

    if (response['status'] == "success") {
      print("chat id" + response["data"]["id"].toString());

      APIURL.chatroomId = response["data"]["id"].toString();
      APIURL.trainerName =
          response["data"]["trainerDetail"]["firstName"].toString() +
              " " +
              response["data"]["trainerDetail"]["lastName"].toString();
      APIURL.traineprofile =
          response["data"]["trainerDetail"]["userAvatar"].toString();

      print(
          " kjdfshgfdhg  ${response["data"]["trainerDetail"]["firstName"].toString() + "" + " ${response["data"]["trainerDetail"]["userAvatar"].toString()}"}");
    } else {
      DialogHelper.showFlutterToast(strMsg: "Something went wrong !");
    }
  }

  Future<void> checkElapsedDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int lastClickTimestamp = prefs.getInt('lastClickTimestamp') ?? 0;
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    int elapsedTime = currentTime - lastClickTimestamp;

    // Check if seven days have passed (7 days = 7  24  60  60  1000 milliseconds)
    if (elapsedTime >= 7 * 24 * 60 * 60 * 1000) {
      AppStringFile.isUpdate = "true";
    } else {
      AppStringFile.isUpdate = "false";
    }
  }

  fetdata()
   {
    tabs = [
      ChangeNotifierProvider<DashBoardProvider>(
        create: (BuildContext context) => DashBoardProvider(),
        child: HomeDashboardScreenActivity(
          callback: (value) {
            if (value == "okopen") {
              _key.currentState!.openDrawer();
            }
          },
        ),
      ),
      ChangeNotifierProvider<TrainingProvider>(
          create: (BuildContext context) => TrainingProvider(),
          child: ExerciseType()),

      ChangeNotifierProvider<DietPlanProvider>(
          create: (BuildContext context) => DietPlanProvider(),
          child: CoachmanScreenActivity()),
      //MyApp111(),
      MessageGroupingWithTimeStamp(),
      // ChatScreen(
      //   image: "",
      //   name: "",
      // ),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        drawer: MenuBarScreens(),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: SafeArea(child: tabs[_currentIndex]),
        bottomNavigationBar: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  topRight: Radius.circular(2.h)),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).cardTheme.color,
                  iconSize: 17.0,
                  selectedIconTheme: IconThemeData(size: 25.0),
                  selectedItemColor: AppHelper.themelight
                      ? AppColors.primarycolorYellow
                      : AppColors.primarycolor,
                  unselectedItemColor: Theme.of(context).colorScheme.primary,
                  selectedFontSize: 14.sp,
                  unselectedFontSize: 13.sp,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: Languages.of(context)!.home,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sports_gymnastics),
                        label: Languages.of(context)!.exercise,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.local_dining_rounded),
                        label: Languages.of(context)!.mealplan,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.chat_outlined),
                        label: Languages.of(context)!.chat,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded),
                        label: Languages.of(context)!.profile,
                        backgroundColor: Colors.white),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
