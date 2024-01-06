class RecipeModel {
  String? status;
  String? message;
  int? total;
  List<RecipeData>? data;

  RecipeModel({this.status, this.message, this.total, this.data});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <RecipeData>[];
      json['data'].forEach((v) {
        data!.add(new RecipeData.fromJson(v));
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

class RecipeData {
  int? id;
  int? categoryId;
  int? subCategoryId;
  int? subSubCategoryId;
  String? title;
  String? shortDescription;
  String? prepareTime;
  String? cookTime;
  int? serving;
  String? calorie;
  String? protein;
  String? fat;
  String? carbohydrate;
  String? note;
  String? createdAt;
  String? status;
  Foodcategory? foodcategory;
  Subcategory? subcategory;
  Subsubcategory? subsubcategory;
  List<CookingSteps>? cookingSteps;
  List<Ingradients>? ingradients;
  List<Recipeimage>? recipeimage;
  Like? like;
  Like? favorite;
  String? rating;
  int? count;
  int? likeCount;
  String? isLike;
  String? isFavorite;
  String? recipeVideo;
  bool? premium;

  RecipeData({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    this.title,
    this.shortDescription,
    this.prepareTime,
    this.cookTime,
    this.serving,
    this.note,
    this.calorie,
    this.protein,
    this.fat,
    this.carbohydrate,
    this.createdAt,
    this.status,
    this.foodcategory,
    this.subcategory,
    this.subsubcategory,
    this.cookingSteps,
    this.ingradients,
    this.recipeimage,
    this.like,
    this.favorite,
    this.rating,
    this.count,
    this.likeCount,
    this.isLike,
    this.premium,
    this.isFavorite,
    this.recipeVideo,
  });

  RecipeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    subSubCategoryId = json['subSubCategoryId'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    prepareTime = json['prepareTime'];
    cookTime = json['cookTime'];
    serving = json['serving'];
    note = json['note'];
    calorie = json['calorie'];
    protein = json['protein'];
    fat = json['fat'];
    carbohydrate = json['carbohydrate'];
    createdAt = json['createdAt'];
    status = json['status'];
    foodcategory = json['foodcategory'] != null
        ? new Foodcategory.fromJson(json['foodcategory'])
        : null;
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    subsubcategory = json['subsubcategory'] != null
        ? new Subsubcategory.fromJson(json['subsubcategory'])
        : null;
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
    like = json['like'] != null ? new Like.fromJson(json['like']) : null;
    favorite =
        json['favorite'] != null ? new Like.fromJson(json['favorite']) : null;
    rating = json['rating'];
    count = json['count'];
    recipeVideo = json['recipeVideo'];
    likeCount = json['likeCount'];
    isLike = json['isLike'].toString();
    isFavorite = json['isFavorite'].toString();
    premium = json['premium'];
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
    data['note'] = this.note;
    data['calorie'] = this.calorie;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbohydrate'] = this.carbohydrate;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    if (this.foodcategory != null) {
      data['foodcategory'] = this.foodcategory!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    if (this.subsubcategory != null) {
      data['subsubcategory'] = this.subsubcategory!.toJson();
    }
    if (this.cookingSteps != null) {
      data['cookingSteps'] = this.cookingSteps!.map((v) => v.toJson()).toList();
    }
    if (this.ingradients != null) {
      data['ingradients'] = this.ingradients!.map((v) => v.toJson()).toList();
    }
    if (this.recipeimage != null) {
      data['recipeimage'] = this.recipeimage!.map((v) => v.toJson()).toList();
    }
    if (this.like != null) {
      data['like'] = this.like!.toJson();
    }
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.toJson();
    }
    data['likeCount'] = this.likeCount;
    data['rating'] = this.rating;
    data['likeCount'] = this.likeCount;
    data['isLike'] = this.isLike;
    data['isFavorite'] = this.isFavorite;
    data['premium'] = this.premium;
    data['recipeVideo'] = this.recipeVideo;
    return data;
  }
}

class Like {
  int? id;

  Like({this.id});

  Like.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class CookingSteps {
  int? recipeId;
  int? step;
  String? description;

  CookingSteps({this.recipeId, this.step, this.description});

  CookingSteps.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipeId'];
    step = json['step'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? amount;
  String? quantity;
  Ingradient? ingradient;

  Ingradients(
      {this.id,
      this.recipeId,
      this.ingradientId,
      this.amount,
      this.quantity,
      this.ingradient});

  Ingradients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeId = json['recipeId'];
    ingradientId = json['ingradientId'];
    amount = json['amount'].toString();
    quantity = json['quantity'];
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
    data['quantity'] = this.quantity;
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

class Subsubcategory {
  int? id;
  String? subSubCategoryName;

  Subsubcategory({this.id, this.subSubCategoryName});

  Subsubcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subSubCategoryName = json['subSubCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subSubCategoryName'] = this.subSubCategoryName;
    return data;
  }
}

class Recipeimage {
  int? recipeId;
  String? image;
  String? imageType;

  Recipeimage({this.recipeId, this.image, this.imageType});

  Recipeimage.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipeId'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipeId'] = this.recipeId;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    return data;
  }
}
