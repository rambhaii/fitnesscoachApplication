class TrainingModel {
  String? status;
  String? message;
  int? total;
  List<Data>? data;

  TrainingModel({this.status, this.message, this.total, this.data});

  TrainingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
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
    data['message'] = message;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;

  String? trainingPlanName;

  List<DayList>? dayList;

  Data({this.id, this.userId, this.trainingPlanName, this.dayList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];

    trainingPlanName = json['TrainingPlanName'];

    if (json['dayList'] != null) {
      dayList = <DayList>[];
      json['dayList'].forEach((v) {
        dayList!.add(DayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;

    data['TrainingPlanName'] = trainingPlanName;

    if (dayList != null) {
      data['dayList'] = dayList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayList {
  int? id;
  String? trainingPlanId;
  String? dayName;

  List<ExerciseDayList>? exerciseDayList;

  DayList({this.id, this.trainingPlanId, this.dayName, this.exerciseDayList});

  DayList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainingPlanId = json['TrainingPlanId'];
    dayName = json['dayName'];

    if (json['exerciseDayList'] != null) {
      exerciseDayList = <ExerciseDayList>[];
      json['exerciseDayList'].forEach((v) {
        exerciseDayList!.add(ExerciseDayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['TrainingPlanId'] = trainingPlanId;
    data['dayName'] = dayName;

    if (exerciseDayList != null) {
      data['exerciseDayList'] =
          exerciseDayList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseDayList {
  int? id;
  int? trainingPlanId;
  int? userId;
  int? exerciseId;
  String? note;
  int? exerciseDayId;
  

  List<SetList>? setList;
  ExerciseDetail? exerciseDetail;

  ExerciseDayList(
      {this.id,
      this.trainingPlanId,
      this.userId,
      this.exerciseId,
      this.note,
      this.exerciseDayId,
      this.setList,
      this.exerciseDetail});

  ExerciseDayList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainingPlanId = json['trainingPlanId'];
    userId = json['userId'];
    exerciseId = json['exerciseId'];
    note = json['note'];
    exerciseDayId = json['exerciseDayId'];

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
    data['note'] = note;
    data['exerciseDayId'] = exerciseDayId;

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
  bool? likeslected = false;

  RepsDetail? repsDetail;
  SetTypeDetail? setTypeDetail;
  List<SetWeightList>? setWeightList;

  SetList({
    this.id,
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
    this.repsDetail,
    this.setTypeDetail,
    this.setWeightList,
    this.likeslected,
  });

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

    repsDetail = json['repsDetail'] != null
        ? RepsDetail.fromJson(json['repsDetail'])
        : null;
    setTypeDetail = json['setTypeDetail'] != null
        ? SetTypeDetail.fromJson(json['setTypeDetail'])
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

    if (repsDetail != null) {
      data['repsDetail'] = repsDetail!.toJson();
    }
    if (setTypeDetail != null) {
      data['setTypeDetail'] = setTypeDetail!.toJson();
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

  RepsDetail({
    this.id,
    this.repsName,
  });

  RepsDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    repsName = json['repsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['repsName'] = repsName;

    return data;
  }
}

class SetTypeDetail {
  int? id;
  String? setType;
  bool? isDrop;
  String? note;

  SetTypeDetail({
    this.id,
    this.setType,
    this.isDrop,
    this.note,
  });

  SetTypeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setType = json['setType'];
    isDrop = json['isDrop'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['setType'] = setType;
    data['isDrop'] = isDrop;
    data['note'] = note;

    return data;
  }
}

class SetWeightList {
  int? id;
  int? setId;
  int? repsNo;
  String? weight;

  SetWeightList({
    this.id,
    this.setId,
    this.repsNo,
    this.weight,
  });

  SetWeightList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setId = json['setId'];
    repsNo = json['repsNo'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['setId'] = setId;
    data['repsNo'] = repsNo;
    data['weight'] = weight;

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

  ExerciseDetail({
    this.id,
    this.categoryId,
    this.video,
    this.image,
    this.title,
    this.note,
  });

  ExerciseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    video = json['video'];
    image = json['image'];
    title = json['title'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['video'] = video;
    data['image'] = image;
    data['title'] = title;
    data['note'] = note;

    return data;
  }
}
