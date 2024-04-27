// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mealsapp/model/recipe.dart';

class shopProvider extends ChangeNotifier{
 final List<Recipe> _recipes = [];

final List<Recipe> _cart = [];

List<Recipe> get cart => _cart;

void addtocart(Recipe recipes, int quantity){
  for(int i = 0; i<quantity ; i++){
    _cart.add(recipes);
    notifyListeners();
  }
}


void removeFromCart(Recipe recipes){
  _cart.remove(recipes);
  notifyListeners();
}


}