import 'package:alpersonalcoachingapp/model/RecipeModel.dart';


class RecipebyIdModel {
  String? status;
  String? message;
  RecipeData? data;

  RecipebyIdModel({this.status, this.message, this.data});

  RecipebyIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RecipeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
