import 'dart:convert';

import 'package:mealsapp/services/recipemodel.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<Recipesmodel>> getAll() async {
    const url = 'https://api.sampleapis.com/recipes/recipes';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final List<Recipesmodel> recipes = json.map((data) {
        return Recipesmodel.fromJson(data);
      }).toList();
      return recipes;
    } else {
  
      throw Exception('Failed to load recipes');
    }
  }
}
