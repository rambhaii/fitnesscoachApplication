class TrainingExcersetlistData {
  String? status;
  String? message;
  Data? data;

  TrainingExcersetlistData({this.status, this.message, this.data});

  TrainingExcersetlistData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  int? trainingPlanId;
  int? userId;
  int? exerciseId;
  int? exerciseDayId;
  Null note;
  String? createdAt;
  String? status;
  List<SetList>? setList;
  ExerciseDetail? exerciseDetail;

  Data(
      {this.id,
      this.trainingPlanId,
      this.userId,
      this.exerciseId,
      this.exerciseDayId,
      this.note,
      this.createdAt,
      this.status,
      this.setList,
      this.exerciseDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainingPlanId = json['trainingPlanId'];
    userId = json['userId'];
    exerciseId = json['exerciseId'];
    exerciseDayId = json['exerciseDayId'];
    note = json['note'];
    createdAt = json['createdAt'];
    status = json['status'];
    if (json['setList'] != null) {
      setList = <SetList>[];
      json['setList'].forEach((v) {
        setList!.add(SetList.fromJson(v));
      });
    }
    exerciseDetail = json['exerciseDetail'] != null
        ? ExerciseDetail.fromJson(json['exerciseDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trainingPlanId'] = trainingPlanId;
    data['userId'] = userId;
    data['exerciseId'] = exerciseId;
    data['exerciseDayId'] = exerciseDayId;
    data['note'] = note;
    data['createdAt'] = createdAt;
    data['status'] = status;
    if (setList != null) {
      data['setList'] = setList!.map((v) => v.toJson()).toList();
    }
    if (exerciseDetail != null) {
      data['exerciseDetail'] = exerciseDetail!.toJson();
    }
    return data;
  }
}

class SetList {
  int? id;
  int? exerciseSetId;
  int? repsId;
  int? setTypeId;
  int? dropTimes;
  String? restTime;
  String? setName;
  int? repsNo;
  String? weight;
  String? video;
  String? note;
  Null createdBy;
  Null updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  RepsDetail? repsDetail;
  List<SetWeightList>? setWeightList;

  SetList(
      {this.id,
      this.exerciseSetId,
      this.repsId,
      this.setTypeId,
      this.dropTimes,
      this.restTime,
      this.setName,
      this.repsNo,
      this.weight,
      this.video,
      this.note,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.repsDetail,
      this.setWeightList});

  SetList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exerciseSetId = json['exerciseSetId'];
    repsId = json['repsId'];
    setTypeId = json['setTypeId'];
    dropTimes = json['dropTimes'];
    restTime = json['restTime'];
    setName = json['setName'];
    repsNo = json['repsNo'];
    weight = json['weight'];
    video = json['video'];
    note = json['note'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    repsDetail = json['repsDetail'] != null
        ? RepsDetail.fromJson(json['repsDetail'])
        : null;
    if (json['setWeightList'] != null) {
      setWeightList = <SetWeightList>[];
      json['setWeightList'].forEach((v) {
        setWeightList!.add(SetWeightList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exerciseSetId'] = exerciseSetId;
    data['repsId'] = repsId;
    data['setTypeId'] = setTypeId;
    data['dropTimes'] = dropTimes;
    data['restTime'] = restTime;
    data['setName'] = setName;
    data['repsNo'] = repsNo;
    data['weight'] = weight;
    data['video'] = video;
    data['note'] = note;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    if (repsDetail != null) {
      data['repsDetail'] = repsDetail!.toJson();
    }
    if (setWeightList != null) {
      data['setWeightList'] =
          setWeightList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepsDetail {
  int? id;
  String? repsName;
  String? createdBy;
  Null updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  Null deletedAt;

  RepsDetail(
      {this.id,
      this.repsName,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt});

  RepsDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    repsName = json['repsName'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['repsName'] = repsName;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class SetWeightList {
  int? id;
  int? setId;
  int? repsNo;
  String? weight;
  Null createdBy;
  Null updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  Null deletedAt;

  SetWeightList(
      {this.id,
      this.setId,
      this.repsNo,
      this.weight,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt});

  SetWeightList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setId = json['setId'];
    repsNo = json['repsNo'];
    weight = json['weight'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['setId'] = setId;
    data['repsNo'] = repsNo;
    data['weight'] = weight;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class ExerciseDetail {
  int? id;
  String? categoryId;
  String? video;
  String? image;
  String? title;
  String? note;
  String? createdBy;
  Null updatedBy;
  String? createdAt;
  String? updatedAt;
  String? status;
  Null deletedAt;

  ExerciseDetail(
      {this.id,
      this.categoryId,
      this.video,
      this.image,
      this.title,
      this.note,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt});

  ExerciseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    video = json['video'];
    image = json['image'];
    title = json['title'];
    note = json['note'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['video'] = video;
    data['image'] = image;
    data['title'] = title;
    data['note'] = note;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
