import 'package:alpersonalcoachingapp/api/likeapi.dart';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocDb {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.AUTH_TOKEN_VALUE = preferences.getString(AppStringFile.authtoken);
    AppHelper.userid = preferences.getString(AppStringFile.userid);
    AppHelper.isLogin = preferences.getString(AppStringFile.isLogin);
    AppHelper.email_VALUE = preferences.getString(AppStringFile.email);
    AppHelper.role = preferences.getString(AppStringFile.role);
    AppHelper.language = preferences.getString("SelectedLanguageCode");
    AppHelper.firstName = preferences.getString(AppStringFile.name);
    AppHelper.lastName = preferences.getString(AppStringFile.lastname);
    AppHelper.userAvatar = preferences.getString(AppStringFile.userAvatar);
    AppHelper.trainerId = preferences.getString(AppStringFile.trainerId);

    if (AppHelper.userid == null || AppHelper.userid == false) 
    {
      
      loginapp = false;
      return false;
    } else {
      LikeApi registerresponse = LikeApi();
      final response = await registerresponse.meapi();

      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
   } catch (e) {
        print(e);
      }

      var data = {
        "facId": token,
      };
      LoginApi loginApi = LoginApi(data);
      final responsedata = await loginApi.factokenregister();
      print("dfgklgfh  ${token}${responsedata}");

      AppHelper.isLogin = response['user']['isLogin'].toString();
      preferences.setString(
          AppStringFile.isLogin, response['user']['isLogin'].toString());
      preferences.setString(
          AppStringFile.trainerId, response['user']['trainerId'].toString());
          print("dkjfhgdf   ${response['status'].toString()}");

      if (response['status'].toString().toLowerCase() == "error") 
      {
        AppHelper.logout();
        return false;
      } else 
      {
        loginapp = true;
        return true;
      }
    }
  }
}
