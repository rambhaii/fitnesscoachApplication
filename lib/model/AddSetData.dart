class AddSetData {
  int? exerciseDayId;
  List<SetList>? setList;

  AddSetData({this.exerciseDayId, this.setList});

  AddSetData.fromJson(Map<String, dynamic> json) {
    exerciseDayId = json['exerciseDayId'];
    if (json['setList'] != null) {
      setList = <SetList>[];
      json['setList'].forEach((v) {
        setList!.add(SetList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exerciseDayId'] = exerciseDayId;
    if (setList != null) {
      data['setList'] = setList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SetList {
  int? id;
  String? restTime;
  String? repsNo;
  String? weight;
  String? note;

  SetList({this.id, this.restTime, this.repsNo, this.weight, this.note});

  SetList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restTime = json['restTime'];
    repsNo = json['repsNo'];
    weight = json['weight'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restTime'] = restTime;
    data['repsNo'] = repsNo;
    data['weight'] = weight;
    data['note'] = note;
    return data;
  }
}
