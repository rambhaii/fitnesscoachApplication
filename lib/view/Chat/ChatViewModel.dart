class ChatViewModel {
  int? id;
  String? message;
  String? file;
  String? userId;
  String? chatRoomId;
  String? deliveryTimestamp;
  String? seen;
  Null seenTimestamp;
  String? author;
  Null createdBy;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  String? status;
  AutherDetail? autherDetail;

  ChatViewModel(
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
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.autherDetail});

  ChatViewModel.fromJson(Map<String, dynamic> json) {
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
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    status = json['status'];
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
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['status'] = status;
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
