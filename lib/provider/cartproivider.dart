import 'package:flutter/material.dart';
import 'package:mealsapp/services/recipemodel.dart';

class ShopProvider extends ChangeNotifier {
  final List<Recipesmodel> _cart = [];

  List<Recipesmodel> get cart => _cart;

  void addToCart(Recipesmodel recipe, int quantity) {
    // Check if the item already exists in the cart
    int index = _cart.indexWhere((item) => item.title == recipe.title);
    if (index != -1) {
      // If the item exists, update its quantity
      _cart[index].count += quantity;
    } else {
      // If the item doesn't exist, add it to the cart
      _cart.add(recipe);
    }
    notifyListeners();
  }

   void removeFromCart(Recipesmodel recipe) {
    // Find the index of the item in the cart
    int index = _cart.indexWhere((item) => item.title == recipe.title);
    if (index != -1) {
      // Decrease the quantity of the item
      _cart[index].count--;
      // If the quantity becomes zero, remove the item from the cart
      if (_cart[index].count == 0) {
        _cart.removeAt(index);
      }
    }
    notifyListeners();
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in _cart) {
      total += double.parse(item.price.toString()); // Assuming price is a string
    }
    return total;
  }
}