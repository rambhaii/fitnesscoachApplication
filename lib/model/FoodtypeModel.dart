class FoodtypeModel {
  String? status;
  String? message;
  int? total;
  List<FoodtypeData>? data;

  FoodtypeModel({this.status, this.message, this.total, this.data});

  FoodtypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <FoodtypeData>[];
      json['data'].forEach((v) {
        data!.add(new FoodtypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodtypeData {
  int? id;
  String? foodType;
  String? symbol;
  String? primaryImage;
  bool? isInCalendar;
  bool? isAnyCategory;
  String? note;
  String? createdAt;
  String? status;

  FoodtypeData(
      {this.id,
      this.foodType,
      this.symbol,
      this.primaryImage,
      this.isInCalendar,
      this.isAnyCategory,
      this.note,
      this.createdAt,
      this.status});

  FoodtypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodType = json['foodType'];
    symbol = json['symbol'];
    primaryImage = json['primaryImage'];
    isInCalendar = json['isInCalendar'];
    isAnyCategory = json['isAnyCategory'];
    note = json['note'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodType'] = this.foodType;
    data['symbol'] = this.symbol;
    data['primaryImage'] = this.primaryImage;
    data['isInCalendar'] = this.isInCalendar;
    data['isAnyCategory'] = this.isAnyCategory;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
