import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/HomePageModel.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  HomePageModel homePageModel = HomePageModel();

  late Homedata homedatalist;

  bool datanotfound = false;

  Future getHomedata() async {
    var url = APIURL.hompageApi;

    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();

    homePageModel = HomePageModel.fromJson(response);

    if (homePageModel.data != null) {
      datanotfound = true;
      homedatalist = homePageModel.data!;
      // _homeData.add(homedata!);
      notifyListeners();
    }
    datanotfound = true;
    notifyListeners();
    return;
  }

  String countnotification = "0";
  Future notificationcount() async {
    ServiceWithHeader service =
        ServiceWithHeader(APIURL.notificationcount);
    final response = await service.datame();

    if (response['status'] == "success") {
      countnotification = response['data'].toString();
    }

    notifyListeners();
    return;
  }
}
