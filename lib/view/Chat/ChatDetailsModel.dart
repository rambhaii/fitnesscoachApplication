class ChatDetailsModel {
  String? status;
  List<Data>? data;

  ChatDetailsModel({this.status, this.data});

  ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? message;
  String? file;
  Null userId;
  String? chatRoomId;
  Null deliveryTimestamp;
  Null seen;
  Null seenTimestamp;
  String? author;
  Null createdBy;
  String? createdAt;
  AutherDetail? autherDetail;

  Data(
      {this.id,
      this.message,
      this.file,
      this.userId,
      this.chatRoomId,
      this.deliveryTimestamp,
      this.seen,
      this.seenTimestamp,
      this.author,
      this.createdBy,
      this.createdAt,
      this.autherDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    file = json['file'];
    userId = json['userId'];
    chatRoomId = json['chatRoomId'];
    deliveryTimestamp = json['deliveryTimestamp'];
    seen = json['seen'];
    seenTimestamp = json['seenTimestamp'];
    author = json['author'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    autherDetail = json['autherDetail'] != null
        ? AutherDetail.fromJson(json['autherDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['file'] = file;
    data['userId'] = userId;
    data['chatRoomId'] = chatRoomId;
    data['deliveryTimestamp'] = deliveryTimestamp;
    data['seen'] = seen;
    data['seenTimestamp'] = seenTimestamp;
    data['author'] = author;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    if (autherDetail != null) {
      data['autherDetail'] = autherDetail!.toJson();
    }
    return data;
  }
}

class AutherDetail {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? phoneNumber;
  String? userType;

  AutherDetail(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.userType});

  AutherDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['userType'] = userType;
    return data;
  }
}
