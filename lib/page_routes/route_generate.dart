import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/DietPlanProvider.dart';
import 'package:alpersonalcoachingapp/provider/NotificationProvider.dart';
import 'package:alpersonalcoachingapp/provider/Recipeprovider.dart';
import 'package:alpersonalcoachingapp/provider/TrainingProvider.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/recipelisting/BeafScreen.dart';
import 'package:alpersonalcoachingapp/recipelisting/RecipeUi.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/view/AdditionlInformation/AddStudentInformation.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/CoachmanfourScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/CoachmanthreeScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/coachmanscreenactivity.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/coachmantwoscreenactivity.dart';
import 'package:alpersonalcoachingapp/view/screen/GallarySCreens/GallaryScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/MealPlanScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/MealPlansDetailsScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/OnBoardingScreen/onboarding_screen.dart';
import 'package:alpersonalcoachingapp/view/screen/SettingsScreen/components/WebviewWidgetUIScreen.dart';
import 'package:alpersonalcoachingapp/view/screen/SettingsScreen/settingscreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/aboutUs/aboutUs.dart';
import 'package:alpersonalcoachingapp/view/screen/change_language_screen.dart';
import 'package:alpersonalcoachingapp/view/screen/contactUs/contactUs.dart';
import 'package:alpersonalcoachingapp/view/screen/contactsupport.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/dashboard.dart';
import 'package:alpersonalcoachingapp/view/screen/ProfileScreens/editprofilescreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/ProfileScreens/profilescreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/Excercise/ExerciseType.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/subscription/SubscriptionScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/favoriteScreen/favoriteScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/TabBarmainpagescreen.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/AvtarRotation.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformthree.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformtwo.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/changespassword.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/forgetpassword.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/login.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/otpverify.dart';
import 'package:alpersonalcoachingapp/view/screen/loginsignup/setnewpassword.dart';
import 'package:alpersonalcoachingapp/view/screen/notification/notification.dart';
import 'package:alpersonalcoachingapp/view/screen/packageScreen/packageScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/personalDetails/personalDetails.dart';
import 'package:alpersonalcoachingapp/view/screen/privacyPolicy/privacyPolicy.dart';
import 'package:alpersonalcoachingapp/view/screen/searchScreen/searchScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/splashscreen.dart';
import 'package:alpersonalcoachingapp/view/screen/welcomescreen.dart';
import 'package:alpersonalcoachingapp/view/termsConditions/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = SplashScreen();
        break;
      case Routes.changeLanguageScreen:
        widgetScreen = ChangeLanguageScreen();
        break;
      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
        break;
      case Routes.welcomeScreen:
        widgetScreen = const WelcomeScreenActivity();
        break;

      case Routes.loginScreenActivity:
        widgetScreen = LoginScreenActivity();
        break;

      case Routes.forgetPassword:
        widgetScreen = ForgetPassword();
        break;
      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
          email: args[AppStringFile.email],
        );
        break;
      case Routes.setnewPassword:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = SetnewPassword(
          email: args[AppStringFile.email],
          otp: args[AppStringFile.otp],
        );
        break;
      case Routes.allRecipeScreenActivity:
        widgetScreen = ChangeNotifierProvider<RecipeProvider>(
          create: (BuildContext context) => RecipeProvider(),
          child: AllRecipeScreenActivity(),
        );
        break;

      // static const String allRecipeScreenActivity = "/allRecipeScreenActivity";
      case Routes.changePassword:
        widgetScreen = ChangePassword();
        break;

      case Routes.homeinformationformtwo:
        widgetScreen = Homeinformationformtwo();
        break;

      case Routes.dashBoardScreenActivity:
        widgetScreen = DashBoardScreenActivity();
        break;

      case Routes.homeinformationformthree:
        widgetScreen = Homeinformationformthree();
        break;
      case Routes.homepageinfotabbarSCreenActivity:
        widgetScreen = HomepageinfotabbarSCreenActivity();
        break;
      // case Routes.homepageinfotabbarSCreenActivity:
      // widgetScreen = TabWeeklyUpdate();
      // break;

      case Routes.subscriptionScreenActivity:
        widgetScreen = SubscriptionScreenActivity();
        break;

      case Routes.profileScreenActivity:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: ProfileScreenActivity());
        break;

      case Routes.personalDetails:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: PersonalDetails());
        break;

      case Routes.editProfile:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: EditProfile(
              profileuserdata: args[AppStringFile.profileuserdata],
            ));
        break;

      // case Routes.beafScreen:
      //   Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      //   widgetScreen = ChangeNotifierProvider<RecipeProvider>(
      //       create: (BuildContext context) => RecipeProvider(),
      //       child: RecipeUi(
      //         mealId: args[AppStringFile.mealId],
      //       ));
      //   break;

      // case Routes.beafScreen:
      //   widgetScreen = RecipeUi();
      //   break;

      case Routes.coachmanScreenActivity:
        widgetScreen = ChangeNotifierProvider<DietPlanProvider>(
            create: (BuildContext context) => DietPlanProvider(),
            child: CoachmanScreenActivity());
        break;



        

      case Routes.coachmantwoScreenActivity:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = CoachmantwoScreenActivity(
          title: args[AppStringFile.title],
          dietPlanData: args[AppStringFile.dietPlanModellist],
        );

        break;
      case Routes.coachmanthreeScreenActivity:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = CoachmanthreeScreenActivity(
          title: args[AppStringFile.title],
          dayList: args[AppStringFile.daylist],
        );

        break;

      case Routes.coachmanfourScreenActivity:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = CoachmanfourScreenActivity(
          title: args[AppStringFile.title],
          mealPlanList: args[AppStringFile.mealPlanList],
        );

        break;

      case Routes.settingScreenActivity:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: SettingScreenActivity());
        break;

      case Routes.notificationScreen:
        widgetScreen = ChangeNotifierProvider<NotificationProvider>(
            create: (BuildContext context) => NotificationProvider(),
            child: NotificationScreen());

        break;

      case Routes.mealPlanScreenActivity:
        widgetScreen = MealPlanScreenActivity();
        break;

      case Routes.webviewWidgetUIScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = WebviewWidgetUIScreen(
          url: args[AppStringFile.url],
          title: args[AppStringFile.title],
        );
        break;
      case Routes.mealPlansDetailsScreenActivity:
        widgetScreen = MealPlansDetailsScreenActivity();
        break;
      case Routes.gallaryScreenActivity:
        widgetScreen = ChangeNotifierProvider<NotificationProvider>(
            create: (BuildContext context) => NotificationProvider(),
            child: GallaryScreenActivity());
        break;

      case Routes.exerciseType:
        widgetScreen = ChangeNotifierProvider<TrainingProvider>(
            create: (BuildContext context) => TrainingProvider(),
            child: ExerciseType());
        break;

      case Routes.contactUsScreen:
        widgetScreen = ContactUs();
        break;

      case Routes.contact_support:
        widgetScreen = ChangeNotifierProvider<TrainingProvider>(
            create: (BuildContext context) => TrainingProvider(),
            child: contactsupport());
        break;

      case Routes.packageScreenActivity:
        widgetScreen = PackageScreenActivity();
        break;
      case Routes.searchScreentActivity:
        widgetScreen = SearchScreentActivity();
        break;
      case Routes.favoriteScreenActivity:
        widgetScreen = FavoriteScreenActivity();
        break;
      case Routes.addStudentInformation:
        widgetScreen = AddStudentInformation();
        break;
      case Routes.avtarRotation:
        widgetScreen = AvtarRotation();
        break;

      case Routes.aboutUsScreen:
        widgetScreen = AboutUs();
        break;

      case Routes.privacyPolicyScreen:
        widgetScreen = PrivacyPolicy();
        break;
      case Routes.termsandcondition:
        widgetScreen = TermsConditions();
        break;

      default:
        widgetScreen = SplashScreen();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
