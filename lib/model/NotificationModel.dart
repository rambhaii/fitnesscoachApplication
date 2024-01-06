class NotificationModel {
  dynamic? status;
  dynamic? message;
  int? total;
  List<Data>? data;

  NotificationModel({this.status, this.message, this.total, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  dynamic? path;
  dynamic? title;
  dynamic? subTitle;
  bool? readStatus;
  dynamic? userId;
  bool? all;
  bool? admin;
  dynamic? image;
  dynamic? note;
  dynamic? createdAt;
  dynamic? status;

  Data(
      {this.id,
      this.path,
      this.title,
      this.subTitle,
      this.readStatus,
      this.userId,
      this.all,
      this.admin,
      this.image,
      this.note,
      this.createdAt,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    title = json['title'];
    subTitle = json['subTitle'];
    readStatus = json['readStatus'];
    userId = json['userId'];
    all = json['all'];
    admin = json['admin'];
    image = json['image'];
    note = json['note'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['readStatus'] = this.readStatus;
    data['userId'] = this.userId;
    data['all'] = this.all;
    data['admin'] = this.admin;
    data['image'] = this.image;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
