import 'dart:convert';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WeeklyUpdateApi {
  Future<bool?> updateData() async {
    bool? values = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var url = Uri.parse(APIURL.weeklyUpdate);

    final request = http.MultipartRequest('POST', url);

    Map<String, String> headers = {
      "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}'
    };

    request.headers.addAll(headers);
    print(
        "dfjhgkj  " + preferences.getString(AppStringFile.imgfront).toString());
    if (preferences.getString(AppStringFile.imgfront) != null &&
        preferences.getString(AppStringFile.imgfront)!.isNotEmpty) {
      final file1 = await http.MultipartFile.fromPath('clientImage1',
          preferences.getString(AppStringFile.imgfront).toString());

      request.files.add(file1);
    }
    if (preferences.getString(AppStringFile.imgback) != null &&
        preferences.getString(AppStringFile.imgback)!.isNotEmpty) {
      final file2 = await http.MultipartFile.fromPath('clientImage2',
          preferences.getString(AppStringFile.imgback).toString());

      request.files.add(file2);
    }
    if (preferences.getString(AppStringFile.imgsid) != null &&
        preferences.getString(AppStringFile.imgsid)!.isNotEmpty) {
      final file3 = await http.MultipartFile.fromPath('clientImage3',
          preferences.getString(AppStringFile.imgsid).toString());
      request.files.add(file3);
    }
    print(
        "klfdghkfjhg" + preferences.getString(AppStringFile.weight).toString());
    request.fields['userId'] = AppHelper.userid!;
    request.fields['weight'] =
        preferences.getString(AppStringFile.weight).toString();
    request.fields['biceps'] =
        preferences.getString(AppStringFile.biceps).toString();
    request.fields['butt'] =
        preferences.getString(AppStringFile.butt).toString();
    request.fields['waist'] =
        preferences.getString(AppStringFile.waist).toString();
    request.fields['thighs'] =
        preferences.getString(AppStringFile.leg).toString();
    request.fields['stepsThisWeek'] =
        preferences.getString(AppStringFile.stepsWeek).toString();
    request.fields['challengesCompleted'] =
        preferences.getString(AppStringFile.previousweekplan).toString();
    request.fields['isHelpfull'] = preferences
            .getString(AppStringFile.comingweekanswer)
            .toString() +
        "," +
        preferences.getString(AppStringFile.comingweeksecondanswer).toString();
    request.fields['dayTrainNextWeek'] =
        preferences.getString(AppStringFile.sunday).toString() +
            "," +
            preferences.getString(AppStringFile.monday).toString() +
            "," +
            preferences.getString(AppStringFile.tuesday).toString() +
            "," +
            preferences.getString(AppStringFile.wednesday).toString() +
            "," +
            preferences.getString(AppStringFile.thursday).toString() +
            "," +
            preferences.getString(AppStringFile.friday).toString() +
            "," +
            preferences.getString(AppStringFile.saturday).toString();

    request.fields['planningForNextWeek'] =
        preferences.getString(AppStringFile.lastQuestionAns).toString();
    request.fields['challengesNextWeek'] =
        preferences.getString(AppStringFile.challengesovercome).toString();
    request.fields['note'] =
        preferences.getString(AppStringFile.didyourplan).toString();
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      var out = jsonDecode(response.body);
      if (out['status'] == "success") {
          saveTimestamp(DateTime.now().millisecondsSinceEpoch);
        print(response.body);
        SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
           

        sharedPreferences.setString(AppStringFile.imgfront, "");
        sharedPreferences.setString(AppStringFile.imgsid, "");
        sharedPreferences.setString(AppStringFile.imgsid, "");
        sharedPreferences.setString(AppStringFile.previousweekplan, "");
        sharedPreferences.setString(AppStringFile.challengesovercome, "");
        sharedPreferences.setString(AppStringFile.comingweekanswer, "");
        sharedPreferences.setString(AppStringFile.comingweeksecondanswer, "");
        sharedPreferences.setString(AppStringFile.sunday, "");
        sharedPreferences.setString(AppStringFile.monday, "");
        sharedPreferences.setString(AppStringFile.tuesday, "");
        sharedPreferences.setString(AppStringFile.wednesday, "");
        sharedPreferences.setString(AppStringFile.thursday, "");
        sharedPreferences.setString(AppStringFile.friday, "");
        sharedPreferences.setString(AppStringFile.saturday, "");
        sharedPreferences.setString(AppStringFile.lastQuestionAns, "");

        values = true;
      } else {
        values = false;
      }
    } catch (e) {
      print(e);
    }
    return values;
  }
  Future<void> saveTimestamp(int timestamp) async 
  {
    AppStringFile.isUpdate = "false";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastClickTimestamp', timestamp);
   
  }
}
