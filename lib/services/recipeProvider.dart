import 'package:flutter/material.dart';
import 'package:mealsapp/services/recipe_service.dart';
import 'package:mealsapp/services/recipemodel.dart';

class RecipeProvider extends ChangeNotifier{
  final _service = RecipeService();
  bool isloading = false; 
  List<Recipesmodel> _Recipes =[];
  List<Recipesmodel> get recipes => _Recipes ;

  Future<void> getAllRecipes() async {
    isloading = true; 
    notifyListeners();

    final Response = await _service.getAll();
    _Recipes = Response;
    isloading=false; 
    notifyListeners();
  }
}