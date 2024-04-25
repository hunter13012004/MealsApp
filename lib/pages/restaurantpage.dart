

import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/model/localdatamodel.dart';
import 'package:mealsapp/model/recipe.dart';
import 'package:mealsapp/model/recipeApi.dart';
import 'package:mealsapp/utils/recipecard.dart';

class restroPage extends StatefulWidget {
  final restrodatamodel restromodel ;

  const restroPage({super.key,required this.restromodel});

  @override
  State<restroPage> createState() => _restroPageState();
}

class _restroPageState extends State<restroPage> {
 List<restrodatamodel> restro = recipedata;
  List<Recipe> _recipes = [];
  bool isloading = true;

  @override
  void initState() {
    _getRecipes();
    super.initState();
  }

  Future<void> _getRecipes() async {
    _recipes = await recipeApi.getrecipe();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          primarycolor.withOpacity(0.5),
          secondarycolor.withOpacity(0.2)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back))
                  ],
                ),
                ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                          restro[index].name,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "restros[index].subtitle",
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "restros[index].rating.toString() + "'/5',
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                          Text(
"                            restros[index].address ?? '',",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    }),
              isloading? Center(child: CircularProgressIndicator(),):  ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: _recipes.length,itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totaltime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].thumbnail);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
