import 'dart:convert';

RelatedRecipe RelatedRecipeFromJson(String str) => RelatedRecipe.fromJson(json.decode(str));

String RelatedRecipeToJson(RelatedRecipe data) => json.encode(data.toJson());

class RelatedRecipe {
  RelatedRecipe(
      {required this.title,
        required this.shortDescription,
        required this.prepareTime,
        required this.cookTime,
        required this.serving,required this.calorie,
        required this.protein,
        required this.fat, required this.recipeVideo,required this.cookingSteps,
        required this.ingradients,
        required this.recipeimage,
      });

  String title;
  String shortDescription;
  String prepareTime; String cookTime; int serving; String calorie;String protein;String fat;String recipeVideo;
  List<Map<String, dynamic>> cookingSteps;  List<Map<String, dynamic>> ingradients;  List<Map<String, dynamic>> recipeimage;

  factory RelatedRecipe.fromJson(Map<String, dynamic> json) => RelatedRecipe(
    title: json["data"]["title"] ?? "",
    shortDescription: json["data"]["shortDescription"] ?? "",
    prepareTime: json["data"]["prepareTime"] ?? "",
    cookTime: json["data"]["cookTime"] ?? "",
    serving: json["data"]["serving"] ?? 0,
    calorie: json["data"]["calorie"] ?? "",
    protein: json["data"]["protein"] ?? "",
    fat: json["data"]["fat"] ?? "",
    recipeVideo: json["data"]["recipeVideo"] ?? "",
    cookingSteps: (json["data"]["cookingSteps"] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [],
    ingradients: (json["data"]["ingradients"] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [],
    recipeimage: (json["data"]["recipeimage"] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [],
  );


  Map<String, dynamic> toJson() => {
    "title":title,
    "shortDescription":shortDescription,
    "prepareTime":prepareTime,
    "cookTime":cookTime,
    "serving":serving,
    "protein":protein,
    "fat":fat,
    "recipeVideo":recipeVideo,
    "cookingSteps":cookingSteps,
    "ingradients":ingradients,"recipeimage":recipeimage,
  };
}
