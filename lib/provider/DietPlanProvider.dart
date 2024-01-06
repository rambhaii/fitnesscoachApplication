import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/DietPlanModel.dart';
import 'package:flutter/material.dart';

class DietPlanProvider extends ChangeNotifier {
  DietPlanModel dietPlanModel = DietPlanModel();
  List<DietPlanData> dietPlanModellistdata = [];
  List<DietPlanData> get dietPlanModellist => dietPlanModellistdata;

  bool datanotfound = false;

  Future getDietPlan() async {
    dietPlanModellistdata = [];
    datanotfound = false;
    var url = APIURL.getDietPlan;

    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();

    dietPlanModel = DietPlanModel.fromJson(response);
    dietPlanModellistdata = [];
    if (dietPlanModel.data != null) {
      if (dietPlanModel.data!.isNotEmpty) {
        for (int i = 0; i < dietPlanModel.data!.length; i++) {
          print("dgfhjsdfhghg   " + dietPlanModel.data!.length.toString());
          dietPlanModellistdata.add(dietPlanModel.data![i]);
        }
      }
    }

    datanotfound = true;
    notifyListeners();
    return;
  }
}
