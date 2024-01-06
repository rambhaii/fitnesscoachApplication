class DietPlanModel {
  dynamic? status;
  dynamic message;
  int? total;
  List<DietPlanData>? data;

  DietPlanModel({this.status, this.message, this.total, this.data});

  DietPlanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <DietPlanData>[];
      json['data'].forEach((v) {
        data!.add(DietPlanData.fromJson(v));
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

class DietPlanData {
  int? id;
  int? userId;
  dynamic? dietPlanName;

  List<DayLists>? dayList;

  DietPlanData({this.id, this.userId, this.dietPlanName, this.dayList});

  DietPlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    dietPlanName = json['dietPlanName'];

    if (json['dayList'] != null) {
      dayList = <DayLists>[];
      json['dayList'].forEach((v) {
        dayList!.add(DayLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['dietPlanName'] = dietPlanName;

    if (dayList != null) {
      data['dayList'] = dayList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayLists {
  int? id;
  dynamic? dietPlanId;
  dynamic? dayName;
  dynamic? note;
  MealPlanDetail? mealPlanDetail;

  DayLists(
      {this.id, this.dietPlanId, this.dayName, this.note, this.mealPlanDetail});

  DayLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietPlanId = json['dietPlanId'];
    dayName = json['dayName'];
    note = json['note'];
    mealPlanDetail = json['mealPlanDetail'] != null
        ? MealPlanDetail.fromJson(json['mealPlanDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dietPlanId'] = dietPlanId;
    data['dayName'] = dayName;
    data['note'] = note;
    if (mealPlanDetail != null) {
      data['mealPlanDetail'] = mealPlanDetail!.toJson();
    }
    return data;
  }
}

class MealPlanDetail {
  int? id;
  dynamic? dietId;
  dynamic? dayId;

  dynamic note;

  List<MealPlanList>? mealPlanList;

  MealPlanDetail(
      {this.id, this.dietId, this.dayId, this.note, this.mealPlanList});

  MealPlanDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietId = json['dietId'];
    dayId = json['dayId'];

    note = json['note'];

    if (json['mealPlanList'] != null) {
      mealPlanList = <MealPlanList>[];
      json['mealPlanList'].forEach((v) {
        mealPlanList!.add(MealPlanList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dietId'] = dietId;
    data['dayId'] = dayId;

    data['note'] = note;

    if (mealPlanList != null) {
      data['mealPlanList'] = mealPlanList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealPlanList {
  int? id;
  dynamic? dayMealPlanId;
  dynamic? name;

  dynamic? note;

  DietPlanDetail? dietPlanDetail;

  MealPlanList(
      {this.id, this.dayMealPlanId, this.name, this.note, this.dietPlanDetail});

  MealPlanList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayMealPlanId = json['dayMealPlanId'];
    name = json['name'];

    note = json['note'];

    dietPlanDetail = json['dietPlanDetail'] != null
        ? DietPlanDetail.fromJson(json['dietPlanDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayMealPlanId'] = dayMealPlanId;
    data['name'] = name;

    data['note'] = note;

    if (dietPlanDetail != null) {
      data['dietPlanDetail'] = dietPlanDetail!.toJson();
    }
    return data;
  }
}

class DietPlanDetail {
  int? id;
  dynamic dietId;
  String? mealId;
  dynamic note;
  dynamic? calorie;
  dynamic? protein;
  dynamic? fat;
  dynamic? carbohydrate;

  List<IngradientList>? ingradientList;

  DietPlanDetail(
      {this.id,
      this.dietId,
      this.mealId,
      this.note,
      this.calorie,
      this.protein,
      this.fat,
      this.carbohydrate,
      this.ingradientList});

  DietPlanDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietId = json['dietId'];
    mealId = json['mealId'];
    note = json['note'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];

    if (json['ingradientList'] != null) {
      ingradientList = <IngradientList>[];
      json['ingradientList'].forEach((v) {
        ingradientList!.add(IngradientList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dietId'] = dietId;
    data['mealId'] = mealId;
    data['note'] = note;
    data['calorie'] = calorie;
    data['protein'] = protein;
    data['fat'] = fat;
    data['carbohydrate'] = carbohydrate;

    if (ingradientList != null) {
      data['ingradientList'] = ingradientList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngradientList {
  int? id;
  int? dietPlanId;
  int? recipeId;
  int? ingradientId;
  dynamic amount;
  dynamic quantity;
  dynamic note;

  IngradientDetail? ingradientDetail;
  List<OptionalIngardientList>? optionalIngardientList;

  IngradientList(
      {this.id,
      this.dietPlanId,
      this.recipeId,
      this.ingradientId,
      this.amount,
      this.quantity,
      this.note,
      this.ingradientDetail,
      this.optionalIngardientList});

  IngradientList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietPlanId = json['dietPlanId'];
    recipeId = json['recipeId'];
    ingradientId = json['ingradientId'];
    amount = json['amount'];
    quantity = json['quantity'];
    note = json['note'];

    ingradientDetail = json['ingradientDetail'] != null
        ? IngradientDetail.fromJson(json['ingradientDetail'])
        : null;
    if (json['optionalIngardientList'] != null) {
      optionalIngardientList = <OptionalIngardientList>[];
      json['optionalIngardientList'].forEach((v) {
        optionalIngardientList!.add(new OptionalIngardientList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dietPlanId'] = dietPlanId;
    data['recipeId'] = recipeId;
    data['ingradientId'] = ingradientId;
    data['amount'] = amount;
    data['quantity'] = quantity;
    data['note'] = note;

    if (ingradientDetail != null) {
      data['ingradientDetail'] = ingradientDetail!.toJson();
    }
    if (this.optionalIngardientList != null) {
      data['optionalIngardientList'] =
          this.optionalIngardientList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngradientDetail {
  int? id;
  dynamic? catagoryId;
  dynamic? title;
  dynamic? calorie;
  dynamic? protein;
  dynamic? fat;
  dynamic? carbohydrate;
  dynamic? image;
  dynamic? type;
  dynamic? createdBy;
  dynamic? updatedBy;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? status;
  dynamic? deletedAt;
  dynamic? amount;

  IngradientDetail(
      {this.id,
      this.catagoryId,
      this.title,
      this.calorie,
      this.protein,
      this.fat,
      this.carbohydrate,
      this.image,
      this.type,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt,
      this.amount});

  IngradientDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catagoryId = json['catagoryId'];
    title = json['title'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];
    image = json['image'];
    type = json['type'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
    id = json['Id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['catagoryId'] = catagoryId;
    data['title'] = title;
    data['calorie'] = calorie;
    data['protein'] = protein;
    data['fat'] = fat;
    data['carbohydrate'] = carbohydrate;
    data['image'] = image;
    data['type'] = type;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['status'] = status;
    data['deletedAt'] = deletedAt;
    data['amount'] = amount;

    return data;
  }
}

class OptionalIngardientList {
  int? id;
  dynamic? dietIngradientId;
  dynamic? optionalIngredientId;
  dynamic? optionalIngredientQty;
  dynamic? optionalIngredientAmount;
  dynamic? createdBy;
  dynamic? updatedBy;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? status;
  dynamic? deletedAt;
  IngradientData? ingradientData;

  OptionalIngardientList(
      {this.id,
      this.dietIngradientId,
      this.optionalIngredientId,
      this.optionalIngredientQty,
      this.optionalIngredientAmount,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.deletedAt,
      this.ingradientData});

  OptionalIngardientList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietIngradientId = json['dietIngradientId'];
    optionalIngredientId = json['optionalIngredientId'];
    optionalIngredientQty = json['optionalIngredientQty'];
    optionalIngredientAmount = json['optionalIngredientAmount'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
    ingradientData = json['ingradientData'] != null
        ? new IngradientData.fromJson(json['ingradientData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dietIngradientId'] = this.dietIngradientId;
    data['optionalIngredientId'] = this.optionalIngredientId;
    data['optionalIngredientQty'] = this.optionalIngredientQty;
    data['optionalIngredientAmount'] = this.optionalIngredientAmount;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['status'] = this.status;
    data['deletedAt'] = this.deletedAt;
    // if (this.ingradientData != null) {
    //   data['ingradientData'] = this.ingradientData!.toJson();
    // }
    return data;
  }
}

class IngradientData {
  int? id;
  dynamic? catagoryId;
  dynamic? title;
  dynamic? calorie;
  dynamic? protein;
  dynamic? fat;
  dynamic? carbohydrate;
  dynamic? image;
  dynamic? amount;
  dynamic? unit;
  dynamic? liveIngNo;
  dynamic? type;
  dynamic? createdBy;
  dynamic? updatedBy;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? status;
  dynamic? deletedAt;

  IngradientData({
    this.id,
    this.catagoryId,
    this.title,
    this.calorie,
    this.protein,
    this.fat,
    this.carbohydrate,
    this.image,
    this.amount,
    this.unit,
    this.liveIngNo,
    this.type,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.deletedAt,
  });

  IngradientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catagoryId = json['catagoryId'];
    title = json['title'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];
    image = json['image'];
    amount = json['amount'];
    unit = json['unit'];
    liveIngNo = json['liveIngNo'];
    type = json['type'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catagoryId'] = this.catagoryId;
    data['title'] = this.title;
    data['calorie'] = this.calorie;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbohydrate'] = this.carbohydrate;
    data['image'] = this.image;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['liveIngNo'] = this.liveIngNo;
    data['type'] = this.type;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['status'] = this.status;
    data['deletedAt'] = this.deletedAt;

    return data;
  }
}
