import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/ContactModel.dart';
import 'package:alpersonalcoachingapp/model/TrainingModel.dart';
import 'package:flutter/material.dart';

class TrainingProvider extends ChangeNotifier {
  TrainingModel trainingModel = TrainingModel();

  List<Data> trainingTypelistdata = [];
  List<Data> get trainingTypelist => trainingTypelistdata;

  bool datanotfound = false;

  Future getTrainingType() async {
    trainingTypelistdata = [];
    var url = APIURL.gettrainingPlan + AppHelper.userid!;
    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();
    datanotfound = false;
    trainingModel = TrainingModel.fromJson(response);
    trainingTypelistdata = [];
    if (trainingModel.data != null) {
      if (trainingModel.data!.isNotEmpty) {
        for (int i = 0; i < trainingModel.data!.length; i++) {
          trainingTypelistdata.add(trainingModel.data![i]);
        }
      }
    }
    datanotfound = true;
    notifyListeners();
    return;
  }

  ContactModel contactModel = ContactModel();

  List<ConatctData> conatctDatalistdata = [];
  List<ConatctData> get conatctDatalist => conatctDatalistdata;

  bool conatctdatanotfound = false;


  Future getContactModel() async {
    conatctDatalistdata = [];
    var url = APIURL.getSupportMessage;
    ServiceWithHeader service = ServiceWithHeader(url);
    final response = await service.data();
    conatctdatanotfound = false;
    
    contactModel = ContactModel.fromJson(response);
    conatctDatalistdata = [];
    if (contactModel.data != null) {
      if (contactModel.data!.isNotEmpty) {
        for (int i = 0; i < contactModel.data!.length; i++) 
        {
          conatctDatalistdata.add(contactModel.data![i]);
        }
      }
    }
    datanotfound = true;
    notifyListeners();
    return;
  }











}


