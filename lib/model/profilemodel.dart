// class ProfileUserModel {
//   String? status;
//   String? message;
//   ProfileUserData? data;

//   ProfileUserModel({this.status, this.message, this.data});

//   ProfileUserModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null
//         ? ProfileUserData.fromJson(json['data'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class ProfileUserData {
//   int? id;
//   String? userId;
//   String? firstName;
//   String? lastName;
//   String? emailAddress;
//   int? phoneNumber;
//   String? userAvatar;

//   ProfileUserData({
//     this.id,
//     this.userId,
//     this.firstName,
//     this.lastName,
//     this.emailAddress,
//     this.phoneNumber,
//     this.userAvatar,
//   });

//   ProfileUserData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['userId'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     emailAddress = json['emailAddress'];
//     phoneNumber = json['phoneNumber'];
//     userAvatar = json['userAvatar'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['userId'] = userId;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     data['emailAddress'] = emailAddress;
//     data['phoneNumber'] = phoneNumber;
//     data['userAvatar'] = userAvatar;
//     return data;
//   }
// }


class ProfileUserModel {
  String? status;
  String? message;
  ProfileUserData? data;

  ProfileUserModel({this.status, this.message, this.data});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProfileUserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileUserData {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? phoneNumber;
  String? userAvatar;
  dynamic age;
  dynamic gender;
  dynamic trainerId;
  dynamic checkInDays;
  dynamic startDate;
  dynamic tags;
  dynamic socialSecurityNumber;
  dynamic isOnline;
  dynamic offlineTime;
  String? status;
  ClientPersonalDetail? clientPersonalDetail;

  ProfileUserData(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.userAvatar,
      this.age,
      this.gender,
      this.trainerId,
      this.checkInDays,
      this.startDate,
      this.tags,
      this.socialSecurityNumber,
      this.isOnline,
      this.offlineTime,
      this.status,
      this.clientPersonalDetail});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    userAvatar = json['userAvatar'];
    age = json['age'];
    gender = json['gender'];
    trainerId = json['trainerId'];
    checkInDays = json['checkInDays'];
    startDate = json['startDate'];
    tags = json['tags'];
    socialSecurityNumber = json['socialSecurityNumber'];
    isOnline = json['isOnline'];
    offlineTime = json['offlineTime'];
    status = json['status'];
    clientPersonalDetail = json['clientPersonalDetail'] != null
        ? ClientPersonalDetail.fromJson(json['clientPersonalDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['userAvatar'] = userAvatar;
    data['age'] = age;
    data['gender'] = gender;
    data['trainerId'] = trainerId;
    data['checkInDays'] = checkInDays;
    data['startDate'] = startDate;
    data['tags'] = tags;
    data['socialSecurityNumber'] = socialSecurityNumber;
    data['isOnline'] = isOnline;
    data['offlineTime'] = offlineTime;
    data['status'] = status;
    if (clientPersonalDetail != null) {
      data['clientPersonalDetail'] = clientPersonalDetail!.toJson();
    }
    return data;
  }
}

class ClientPersonalDetail {
  int? id;
  String? userId;
  String? startingWeight;
  String? currentWeight;
  String? length;
  String? activity;
  String? disease;
  String? experience;
  String? trainingDaysPerWeek;
  String? trainingPlace;
  String? measure;
  String? targetWeight;
  String? allergy;
  String? mealPerDay;
  String? clientImage1;
  String? clientImage2;
  String? clientImage3;
  String? note;
  String? gender;
  String? dob;
  String? startDate;
  String? checkInDays;
  String? tags;
  String? socialSecurityNumber;


  ClientPersonalDetail(
      {this.id,
      this.userId,
      this.startingWeight,
      this.currentWeight,
      this.length,
      this.activity,
      this.disease,
      this.experience,
      this.trainingDaysPerWeek,
      this.trainingPlace,
      this.measure,
      this.targetWeight,
      this.allergy,
      this.mealPerDay,
      this.clientImage1,
      this.clientImage2,
      this.clientImage3,
      this.note,
      this.gender,
      this.dob,
      this.startDate,
      this.checkInDays,
      this.tags,
      this.socialSecurityNumber,
     });

  ClientPersonalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    startingWeight = json['startingWeight'];
    currentWeight = json['currentWeight'];
    length = json['length'];
    activity = json['activity'];
    disease = json['disease'];
    experience = json['experience'];
    trainingDaysPerWeek = json['trainingDaysPerWeek'];
    trainingPlace = json['trainingPlace'];
    measure = json['measure'];
    targetWeight = json['targetWeight'];
    allergy = json['allergy'];
    mealPerDay = json['mealPerDay'];
    clientImage1 = json['clientImage1'];
    clientImage2 = json['clientImage2'];
    clientImage3 = json['clientImage3'];
    note = json['note'];
    gender = json['gender'];
    dob = json['dob'];
    startDate = json['startDate'];
    checkInDays = json['checkInDays'];
    tags = json['tags'];
    socialSecurityNumber = json['socialSecurityNumber'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['startingWeight'] = startingWeight;
    data['currentWeight'] = currentWeight;
    data['length'] = length;
    data['activity'] = activity;
    data['disease'] = disease;
    data['experience'] = experience;
    data['trainingDaysPerWeek'] = trainingDaysPerWeek;
    data['trainingPlace'] = trainingPlace;
    data['measure'] = measure;
    data['targetWeight'] = targetWeight;
    data['allergy'] = allergy;
    data['mealPerDay'] = mealPerDay;
    data['clientImage1'] = clientImage1;
    data['clientImage2'] = clientImage2;
    data['clientImage3'] = clientImage3;
    data['note'] = note;
    data['gender'] = gender;
    data['dob'] = dob;
    data['startDate'] = startDate;
    data['checkInDays'] = checkInDays;
    data['tags'] = tags;
    data['socialSecurityNumber'] = socialSecurityNumber;
   
    return data;
  }
}
