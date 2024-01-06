class RecipeModel {
  String? status;
  List<Data>? data;

  RecipeModel({this.status, this.data});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  int? subCategoryId;
  Null? subSubCategoryId;
  String? title;
  String? shortDescription;
  String? prepareTime;
  String? cookTime;
  int? serving;
  bool? premium;
  String? calorie;
  String? protein;
  String? fat;
  String? carbohydrate;
  String? recipeVideo;
  String? note;
  String? createdAt;
  String? status;
  List<Foodtypes>? foodtypes;
  Foodcategory? foodcategory;
  Subcategory? subcategory;
  Null? subsubcategory;
  List<CookingSteps>? cookingSteps;
  List<Ingradients>? ingradients;
  List<Recipeimage>? recipeimage;
  
  int? quantity;
  int? likeCount;
  Null? rating;
  int? count;
 

  Data(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.subSubCategoryId,
      this.title,
      this.shortDescription,
      this.prepareTime,
      this.cookTime,
      this.serving,
      this.premium,
      this.calorie,
      this.protein,
      this.fat,
      this.carbohydrate,
      this.recipeVideo,
      this.note,
      this.createdAt,
      this.status,
      this.foodtypes,
      this.foodcategory,
      this.subcategory,
      this.subsubcategory,
      this.cookingSteps,
      this.ingradients,
      this.recipeimage,
    
      this.quantity,
      this.likeCount,
      this.rating,
      this.count,
 
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    subSubCategoryId = json['subSubCategoryId'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    prepareTime = json['prepareTime'];
    cookTime = json['cookTime'];
    serving = json['serving'];
    premium = json['premium'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];
    recipeVideo = json['recipeVideo'];
    note = json['note'];
    createdAt = json['createdAt'];
    status = json['status'];
    if (json['foodtypes'] != null) {
      foodtypes = <Foodtypes>[];
      json['foodtypes'].forEach((v) {
        foodtypes!.add(new Foodtypes.fromJson(v));
      });
    }
    foodcategory = json['foodcategory'] != null
        ? new Foodcategory.fromJson(json['foodcategory'])
        : null;
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    subsubcategory = json['subsubcategory'];
    if (json['cookingSteps'] != null) {
      cookingSteps = <CookingSteps>[];
      json['cookingSteps'].forEach((v) {
        cookingSteps!.add(new CookingSteps.fromJson(v));
      });
    }
    if (json['ingradients'] != null) {
      ingradients = <Ingradients>[];
      json['ingradients'].forEach((v) {
        ingradients!.add(new Ingradients.fromJson(v));
      });
    }
    if (json['recipeimage'] != null) {
      recipeimage = <Recipeimage>[];
      json['recipeimage'].forEach((v) {
        recipeimage!.add(new Recipeimage.fromJson(v));
      });
    }
   
    quantity = json['quantity'];
    likeCount = json['likeCount'];
    rating = json['rating'];
    count = json['count'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['subCategoryId'] = this.subCategoryId;
    data['subSubCategoryId'] = this.subSubCategoryId;
    data['title'] = this.title;
    data['shortDescription'] = this.shortDescription;
    data['prepareTime'] = this.prepareTime;
    data['cookTime'] = this.cookTime;
    data['serving'] = this.serving;
    data['premium'] = this.premium;
    data['calorie'] = this.calorie;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbohydrate'] = this.carbohydrate;
    data['recipeVideo'] = this.recipeVideo;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    if (this.foodtypes != null) {
      data['foodtypes'] = this.foodtypes!.map((v) => v.toJson()).toList();
    }
    if (this.foodcategory != null) {
      data['foodcategory'] = this.foodcategory!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    data['subsubcategory'] = this.subsubcategory;
    if (this.cookingSteps != null) {
      data['cookingSteps'] = this.cookingSteps!.map((v) => v.toJson()).toList();
    }
    if (this.ingradients != null) {
      data['ingradients'] = this.ingradients!.map((v) => v.toJson()).toList();
    }
    if (this.recipeimage != null) {
      data['recipeimage'] = this.recipeimage!.map((v) => v.toJson()).toList();
    }
   
    data['quantity'] = this.quantity;
    data['likeCount'] = this.likeCount;
    data['rating'] = this.rating;
    data['count'] = this.count;
   
    return data;
  }
}

class Foodtypes {
  int? id;
  int? foodTypeId;
  FoodType? foodType;

  Foodtypes({this.id, this.foodTypeId, this.foodType});

  Foodtypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodTypeId = json['foodTypeId'];
    foodType = json['foodType'] != null
        ? new FoodType.fromJson(json['foodType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodTypeId'] = this.foodTypeId;
    if (this.foodType != null) {
      data['foodType'] = this.foodType!.toJson();
    }
    return data;
  }
}

class FoodType {
  int? id;
  String? foodType;
  bool? isInCalendar;
  bool? isAnyCategory;
  String? primaryImage;

  FoodType(
      {this.id,
      this.foodType,
      this.isInCalendar,
      this.isAnyCategory,
      this.primaryImage});

  FoodType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodType = json['foodType'];
    isInCalendar = json['isInCalendar'];
    isAnyCategory = json['isAnyCategory'];
    primaryImage = json['primaryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodType'] = this.foodType;
    data['isInCalendar'] = this.isInCalendar;
    data['isAnyCategory'] = this.isAnyCategory;
    data['primaryImage'] = this.primaryImage;
    return data;
  }
}

class Foodcategory {
  int? id;
  String? categoryName;

  Foodcategory({this.id, this.categoryName});

  Foodcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    return data;
  }
}

class Subcategory {
  int? id;
  String? subCategoryName;

  Subcategory({this.id, this.subCategoryName});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['subCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subCategoryName'] = this.subCategoryName;
    return data;
  }
}

class CookingSteps {
  int? id;
  int? recipeId;
  int? step;
  String? description;

  CookingSteps({this.id, this.recipeId, this.step, this.description});

  CookingSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipeId'];
    step = json['step'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['step'] = this.step;
    data['description'] = this.description;
    return data;
  }
}

class Ingradients {
  int? id;
  String? recipeId;
  String? ingradientId;
  int? amount;
  Ingradient? ingradient;

  Ingradients(
      {this.id,
      this.recipeId,
      this.ingradientId,
      this.amount,
      this.ingradient});

  Ingradients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipeId'];
    ingradientId = json['ingradientId'];
    amount = json['amount'];
    ingradient = json['ingradient'] != null
        ? new Ingradient.fromJson(json['ingradient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['ingradientId'] = this.ingradientId;
    data['amount'] = this.amount;
    if (this.ingradient != null) {
      data['ingradient'] = this.ingradient!.toJson();
    }
    return data;
  }
}

class Ingradient {
  int? id;
  String? title;
  String? calorie;
  String? protein;
  String? fat;
  String? carbohydrate;

  Ingradient(
      {this.id,
      this.title,
      this.calorie,
      this.protein,
      this.fat,
      this.carbohydrate});

  Ingradient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['calorie'] = this.calorie;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbohydrate'] = this.carbohydrate;
    return data;
  }
}

class Recipeimage {
  int? id;
  int? recipeId;
  String? image;
  String? imageType;

  Recipeimage({this.id, this.recipeId, this.image, this.imageType});

  Recipeimage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipeId'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipeId'] = this.recipeId;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    return data;
  }
}
