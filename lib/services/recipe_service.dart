import 'dart:convert';

import 'package:mealsapp/services/recipemodel.dart';
import 'package:http/http.dart' as http ;

class RecipeService{
  Future  getAll() async {
const url = 'https://api.sampleapis.com/recipes/recipes';
final uri =Uri.parse(url);
final respone = await http.get(uri);
if(respone.statusCode == 200){
  final json = jsonDecode(respone.body) as List ;
  final recipes = json.map((e){
    return Recipesmodel(e['title'], e['cookTime'], e['ingredients'],e['photoUrl'] ,e['cuisine'], e['mainIngredient']);
  }).toList();
  return recipes; 
}
return [] ;
  }
}