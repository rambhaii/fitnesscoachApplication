class HomePageModel {
  String? status;
  Homedata? data;

  HomePageModel({this.status, this.data});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Homedata.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Homedata {
  int? targetWeight;
  int? currentWeight;
  int? currentBiceps;
  int? changBiceps;
  int? currentButt;
  int? changButt;
  int? currentWaist;
  int? changetWaist;
  int? currentThighs;
  int? changetThighs;
  int? changeWeight;
  int? totalWeekCount;
  List<WeightData>? weightData;

  Homedata(
      {this.targetWeight,
      this.currentWeight,
      this.currentBiceps,
      this.changBiceps,
      this.currentButt,
      this.changButt,
      this.currentWaist,
      this.changetWaist,
      this.currentThighs,
      this.changetThighs,
      this.changeWeight,
      this.totalWeekCount,
      this.weightData});

  Homedata.fromJson(Map<String, dynamic> json) {
    targetWeight = json['targetWeight'];
    currentWeight = json['currentWeight'];
    currentBiceps = json['currentBiceps'];
    changBiceps = json['changBiceps'];
    currentButt = json['currentButt'];
    changButt = json['changButt'];
    currentWaist = json['currentWaist'];
    changetWaist = json['changetWaist'];
    currentThighs = json['currentThighs'];
    changetThighs = json['changetThighs'];
    changeWeight = json['changeWeight'];
    totalWeekCount = json['totalWeekCount'];
    if (json['weightData'] != null) {
      weightData = <WeightData>[];
      json['weightData'].forEach((v) {
        weightData!.add(new WeightData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targetWeight'] = targetWeight;
    data['currentWeight'] = currentWeight;
    data['currentBiceps'] = currentBiceps;
    data['changBiceps'] = changBiceps;
    data['currentButt'] = currentButt;
    data['changButt'] = changButt;
    data['currentWaist'] = currentWaist;
    data['changetWaist'] = changetWaist;
    data['currentThighs'] = currentThighs;
    data['changetThighs'] = changetThighs;
    data['changeWeight'] = changeWeight;
    data['totalWeekCount'] = totalWeekCount;
    if (this.weightData != null) {
      data['weightData'] = this.weightData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeightData {
  String? weight;

  WeightData({this.weight});

  WeightData.fromJson(Map<String, dynamic> json) 
  {
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weight'] = this.weight;
    return data;
  }
}
