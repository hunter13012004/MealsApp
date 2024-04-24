import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mealsapp/model/recipe.dart';

class recipeApi {
  static Future<List<recipe>> getrecipe() async {
    var url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list?limit=24&start=0');
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'e2bc9d8ba9msh9d2c2af1385b51ep1cadc1jsne49a121d839f',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return recipe.recipesFromSnapshot(_temp);
  }
}

// var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list", {
//   'limit': '24', 
//   'start': '0'
// });



// const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
// 	'X-RapidAPI-Key': '26309e9c4amsh43a6e01c1b3e314p16c2c1jsn6772c23df724',
// 	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'

// static Future<List<recipe>> getrecipe() async{
//   var url =Uri.http('yummly2.p.rapidapi.com','/feeds/list',{'limit': '24',
//  	'start': '0'});
//   final response =await http.get(url ,headers: {
//     	'X-RapidAPI-Key': '26309e9c4amsh43a6e01c1b3e314p16c2c1jsn6772c23df724',
// 	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
//   });


