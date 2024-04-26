import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mealsapp/model/recipe.dart';

class recipeApi {
  static Future<List<Recipe>> getrecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com','/feeds/list',{'limit': '30', 'start': '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'e2bc9d8ba9msh9d2c2af1385b51ep1cadc1jsne49a121d839f',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}