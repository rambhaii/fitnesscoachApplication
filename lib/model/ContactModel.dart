class ContactModel {
  String? status;
  String? message;
  int? total;
  List<ConatctData>? data;

  ContactModel({this.status, this.message, this.total, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <ConatctData>[];
      json['data'].forEach((v) {
        data!.add(new ConatctData.fromJson(v));
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

class ConatctData {
  int? id;
  String? userId;
  String? question;
  String? answer;
  dynamic? description;
  String? createdAt;
  String? status;

  ConatctData(
      {this.id,
      this.userId,
      this.question,
      this.answer,
      this.description,
      this.createdAt,
      this.status});

  ConatctData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    question = json['question'];
    answer = json['answer'];
    description = json['description'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
