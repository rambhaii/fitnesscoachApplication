import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/GallaryImgModel.dart';
import 'package:alpersonalcoachingapp/model/NotificationModel.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationModel notificationModel = NotificationModel();
  List<Data> notificationlist = [];
  List<Data> get notificationlistData => notificationlist;
  bool datanotfound = false;

  Future getNotification() async {
    notificationlist = [];
    var url = APIURL.getNotification;
    print("dfkjhgkjfghklj");

    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();

    notificationModel = NotificationModel.fromJson(response);
    print("kfdsdfhgkj");
    notificationlist = [];
    if (notificationModel.data != null) {
      if (notificationModel.data!.isNotEmpty) {
        for (int i = 0; i < notificationModel.data!.length; i++) {
          notificationlist.add(notificationModel.data![i]);
        }
      }
    }
    datanotfound = true;
    notifyListeners();
    return;
  }

  GallaryImgModel gallaryImgModel = GallaryImgModel();
  List<GallaryImages> gallaryImagesList = [];
  List<GallaryImages> get gallaryImagesListsData => gallaryImagesList;
  bool gallaryDatanotfound = false;

  Future getGallaryImages() async {
    gallaryImagesList = [];
    var url = APIURL.getGallaryImage;

    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();

    gallaryImgModel = GallaryImgModel.fromJson(response);
    gallaryImagesList = [];
    if (gallaryImgModel.data != null) {
      if (gallaryImgModel.data!.isNotEmpty) {
        for (int i = 0; i < gallaryImgModel.data!.length; i++) {
          print("gallary");
          gallaryImagesList.add(gallaryImgModel.data![i]);
        }
      }
    }
    gallaryDatanotfound = true;
    notifyListeners();
    return;
  }
}
