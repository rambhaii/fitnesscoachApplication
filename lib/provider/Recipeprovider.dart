import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/FoodtypeModel.dart';
import 'package:alpersonalcoachingapp/model/RecipeModel.dart';
import 'package:alpersonalcoachingapp/model/RecipebyIdModel.dart';
import 'package:alpersonalcoachingapp/model/RelatedRecipe.dart';
import 'package:alpersonalcoachingapp/model/RelatedrecipeModel.dart';
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  int pageNumrecipe = 1;
 
  RecipeModel recipeModel = RecipeModel();
  RecipebyIdModel recipeModelbyid = RecipebyIdModel();
  RelatedrecipeModel relatedrecipeModel = RelatedrecipeModel();

 
  FoodtypeModel foodtypeModel = FoodtypeModel();


  List<RecipeData> _recipelist = [];
  List<RecipeData> get recipeList => _recipelist;

  bool datanotfound = false;
  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;

  List<RecipeData> _recipelistbyid = [];
  List<RecipeData> get recipeListbyid => _recipelistbyid;
  bool datanotbyidfound = false;

  List<RelatedRecipeData> _reletedrecipelist = [];
  List<RelatedRecipeData> get reletedrecipeList => _reletedrecipelist;
  bool datanotbyrelatedrecipefound = false;

 

  List<FoodtypeData> _foodtypelist = [];
  List<FoodtypeData> get foodtypeList => _foodtypelist;

  

  Future recipelist(String subcategoryname, int page, String type) async {
    if (page == 1) {
      datanotfound = false;
      isFirstdatafound = true;
    }



    var url = APIURL.RECIPE +
        "?$type=" +
        subcategoryname +
        "&limit=7" +
        "&page=$page";
    // +
    // "&protein=$protein" +
    // "&fat=$fat" +
    // "&carbohydrate=$carbohydrate" +
    // "&calorie=$calorie";

    ServiceWithHeader _service = ServiceWithHeader(url);

    final response = await _service.data();
    recipeModel = RecipeModel.fromJson(response);
    if (page == 1) {
      _recipelist = [];
    }

    if (recipeModel.data != null) {
      if (recipeModel.data!.length > 0) {
        print(recipeModel.data!.length);
        for (int i = 0; i < recipeModel.data!.length; i++) {
          // print(foodcategoryModel.data![i]);
          _recipelist.add(recipeModel.data![i]);
        }
      } else {
        if (page == 1) {
          datanotfound = true;
        }
        hasfirst = false;
      }
    } else {
      if (page == 1) {
        datanotfound = true;
      }
      hasfirst = false;
    }
    isFirstdatafound = false;
    print(hasfirst);
    print(_recipelist);
    notifyListeners();
    return;
  }

  Future recipelistfoodtype(String subcategoryname, int page) async {
    if (page == 1) {
      datanotfound = false;
      isFirstdatafound = true;
    }
    

    print("object data");
    var url = APIURL.RECIPE +
        "?foodtype=" +
        subcategoryname +
        "&limit=7" +
        "&page=$page";
    // +
    // "&protein=$protein";
    // +
    // "&fat=$fat" +
    // "&carbohydrate=$carbohydrate" +
    // "&calorie=$calorie";
    ServiceWithHeader _service = ServiceWithHeader(url);

    final response = await _service.data();
    recipeModel = RecipeModel.fromJson(response);
    if (page == 1) {
      _recipelist = [];
    }

    if (recipeModel.data != null) {
      if (recipeModel.data!.length > 0) {
        print(recipeModel.data!.length);
        for (int i = 0; i < recipeModel.data!.length; i++) {
          // print(foodcategoryModel.data![i]);
          _recipelist.add(recipeModel.data![i]);
        }
      } else {
        if (page == 1) {
          datanotfound = true;
        }
        hasfirst = false;
      }
    } else {
      if (page == 1) {
        datanotfound = true;
      }
      hasfirst = false;
    }
    isFirstdatafound = false;

    notifyListeners();
    return;
  }

  Future allrecipelist(int page, String foodtype, String search) async
   {
    if (page == 1) {
      datanotfound = false;
      isFirstdatafound = true;
    }

    var url = APIURL.RECIPE + "?refrigerator=$foodtype&page=$page&search=$search";

    ServiceWithHeader _service = ServiceWithHeader(url);

    final response = await _service.data();
    recipeModel = RecipeModel.fromJson(response);
    if (page == 1) {
      _recipelist = [];
    }

    if (recipeModel.data != null) {
      if (recipeModel.data!.length > 0) {
        print(recipeModel.data!.length);
        for (int i = 0; i < recipeModel.data!.length; i++)
        {
          // print(foodcategoryModel.data![i]);
          _recipelist.add(recipeModel.data![i]);
        }
      } else {
        if (page == 1) {
          datanotfound = true;
        }
        hasfirst = false;
      }
    } else {
      if (page == 1) {
        datanotfound = true;
      }
      hasfirst = false;
    }
    isFirstdatafound = false;
    notifyListeners();
    return;
  }

  Future loadMore(String subcategoryname, String type) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await recipelist(subcategoryname, pageNumrecipe, type);

      isLoadMoreRunning = false;
    }
  }

  Future loadMorefoodtype(String subcategoryname) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await recipelistfoodtype(subcategoryname, pageNumrecipe);

      isLoadMoreRunning = false;
    }
  }

  Future loadMoreallrecipe(String foodtype) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await allrecipelist(pageNumrecipe, foodtype, '');

      isLoadMoreRunning = false;
    }
  }

  Future recipebyid(String recipeid) async {
    datanotfound = false;

    var url = APIURL.RECIPE + recipeid;
    ServiceWithHeader _service = new ServiceWithHeader(url);

    final response = await _service.data();
    recipeModelbyid = RecipebyIdModel.fromJson(response);
    _recipelistbyid = [];
    if (recipeModelbyid.data != null) {
      // print(recipeModelbyid.data!.length);
      // for (int i = 0; i < recipeModelbyid.data!.length; i++) {
      // print(foodcategoryModel.data![i]);

      _recipelistbyid.add(recipeModelbyid.data!);
      // }
    }
    notifyListeners();
    return;
  }



}
