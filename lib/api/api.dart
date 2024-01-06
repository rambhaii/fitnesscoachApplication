class APIURL {
  static const String SOCKETURL = "http://coachbyapp-api.devshs.com/";
  static const String ROOT = "http://coachbyapp-api.devshs.com/";
  static const String HOME = "$ROOT/api/customers";
  static const String MYHOME = "$ROOT/api";
  static const String REGISTRATION = "$HOME/signUp";
  static const String LOGIN = "$HOME/login";
  static const String ME = "$HOME/me";
  static const String socialmediaLOGIN = "$HOME/loginwithsocialmedia";
  static const String googlesocialmediaLOGIN = "$HOME/login-with-google";
  static const String facebooksocialmediaLOGIN = "$HOME/login-with-facebook";
  static const String applesocialmediaLOGIN = "$HOME/login-with-apple";
  static const String VERIFYOTP = "$HOME/verify-otp";
  static const String registerfcmtoken = "$MYHOME/fac-token";
  static const String FORGETVERIFYOTP = "$HOME/send-otp";
  static const String FORGETPASSWORD = "$HOME/forget-password";
  static const String SETNEWPASSWORD = "$HOME/change-password";
  static const String CHANGEPASSWORD = "$HOME/change-password";
  static const String USERPROFILE = "$HOME/";
  static const String USERPROFILEUPDATE = "$MYHOME/customers/";
  static const String imageurl = "$ROOT/";
  static const String Deletecalenderfood = "$MYHOME/calendars/";
  static const String deleteaccount = "$ROOT/api/customers/";
  //web url
  static const String weburl = "https://www.alcoaching.se";

  // static const String aboutus = "$HOME/om-mig";
  static const String aboutus = "$ROOT/api/aboutus";
  static const String contactus = "$ROOT/api/contactus";

  static const String privacypolicy = "$weburl/sekretess-policy";
  static const String termsandcondition = "$weburl/regler-och-villkor-2";
  static const String playstoreurl =
      "https://play.google.com/store/apps/details?id=com.halsogourmet.app";
  static const String appStorestoreurl =
      "https://apps.apple.com/in/app/h%C3%coachbyApp/id1662853472";

  static const String shareapp =
      "https://play.google.com/store/apps/details?id=com.coachbyapp.app";
  static const String addInformation = "$ROOT/api/client-personal-detail";
  static const String ExerciseType = "$ROOT/api/exercise/";
  static const String createchatRoom = "$MYHOME/chats/room";
  static String chatroomId = "";
  static String trainerName = "";
  static String traineprofile = "";
  static String trainerStatus = "";
  static const String getchatdata = "$MYHOME/chats/room/";
  static const String gettrainingPlan = "$MYHOME/training-plan/userId/";
  static const String updateSetValue = "$MYHOME/exercise-set/update/";
  static const String getDietPlan = "$MYHOME/diet-plan/dietlist";
  static const String getNotification = "$MYHOME/notifications";
  static const String weeklyUpdate = "$MYHOME/weekly-reports";
  static const String hompageApi = "$MYHOME/weekly-reports/userId/:userId";
  static const String getGallaryImage = "$MYHOME/galleries/:userId";
  static const String getExceiseBysetId = "$MYHOME/exercise-set/";
  static const String notificationcount = "$MYHOME/notifications/count";
  static const String getRecipes = "$MYHOME/diet-ingradients/relatedrecipe/";
  //customer Packages
  static const String customerpackages = "$MYHOME/customer-packages";
  static const String contactsuport =
      "http://coachbyapp-api.devshs.com/api/support/";
  static const String getSupportMessage =
      "http://coachbyapp-api.devshs.com/api/support/customer";
       static const String RECIPE = "$MYHOME/fetch/recipe";

    
}
