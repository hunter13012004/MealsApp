// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mealsapp/services/recipemodel.dart';

class shopProvider extends ChangeNotifier{
 final List<Recipesmodel> _recipes = [];

final List<Recipesmodel> _cart = [];

List<Recipesmodel> get cart => _cart;

void addtocart(Recipesmodel recipes, int quantity){
  for(int i = 0; i<quantity ; i++){
    _cart.add(recipes);
    notifyListeners();
  }
}


void removeFromCart(Recipesmodel recipes){
  _cart.remove(recipes);
  notifyListeners();
}


}