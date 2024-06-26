import 'dart:math';

class Recipesmodel {
  final String title;
  final int cookTime;
  final String ingredients;
  final String photoUrl;
  final String cuisine;
  final String mainIngredient;
  final int price;  // Price of the recipe
  int count;  // Quantity in cart

  Recipesmodel(
    this.title,
    this.cookTime,
    this.ingredients,
    this.photoUrl,
    this.cuisine,
    this.mainIngredient,
    {required this.price, this.count = 1}  // Initialize count with default value of 1
  );

  // Factory constructor to create an instance from a JSON map
  factory Recipesmodel.fromJson(Map<String, dynamic> json) {
    return Recipesmodel(
      json['title'] ?? 'Unknown title',
      json['cookTime'] ?? 0,
      json['ingredients'] ?? 'No ingredients listed',
      json['photoUrl'] ?? '',
      json['cuisine'] ?? 'Unknown cuisine',
      json['mainIngredient'] ?? 'Unknown main ingredient',
      price: (Random().nextDouble() * 20 + 5).round(), // Generate random price
      count: 1,  // Initialize count when creating from JSON
    );
  }
}
