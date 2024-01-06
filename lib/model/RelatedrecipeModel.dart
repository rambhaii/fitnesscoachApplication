class RelatedrecipeModel {
  String? status;
  String? message;
  int? total;
  List<RelatedRecipeData>? data;

  RelatedrecipeModel({this.status, this.message, this.total, this.data});

  RelatedrecipeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <RelatedRecipeData>[];
      json['data'].forEach((v) {
        data!.add(new RelatedRecipeData.fromJson(v));
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

class RelatedRecipeData {
  int? id;
  int? categoryId;
  int? subCategoryId;
  int? subSubCategoryId;
  String? title;
  String? shortDescription;
  String? prepareTime;
  String? cookTime;
  int? serving;
  bool? premium;
  String? note;
  String? createdAt;
  String? status;
  List<Recipeimage>? recipeimage;
  String? like;
  String? favorite;
  // List<Null>? review;

  RelatedRecipeData({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    this.title,
    this.shortDescription,
    this.prepareTime,
    this.cookTime,
    this.serving,
    this.premium,
    this.note,
    this.createdAt,
    this.status,
    this.recipeimage,
    this.like,
    this.favorite,
  });

  RelatedRecipeData.fromJson(Map<String, dynamic> json) {
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
    note = json['note'];
    createdAt = json['createdAt'];
    status = json['status'];
    if (json['recipeimage'] != null) {
      recipeimage = <Recipeimage>[];
      json['recipeimage'].forEach((v) {
        recipeimage!.add(new Recipeimage.fromJson(v));
      });
    }
    like = json['like'];
    favorite = json['favorite'];
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
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    if (this.recipeimage != null) {
      data['recipeimage'] = this.recipeimage!.map((v) => v.toJson()).toList();
    }
    data['like'] = this.like;
    data['favorite'] = this.favorite;

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
