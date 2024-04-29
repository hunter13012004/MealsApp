import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mealsapp/pages/fooddetailpage.dart';
import 'package:mealsapp/services/recipeProvider.dart';
import 'package:provider/provider.dart';

class RandomRecipesGridView extends StatefulWidget {
  const RandomRecipesGridView({super.key});

  @override
  _RandomRecipesGridViewState createState() => _RandomRecipesGridViewState();
}

class _RandomRecipesGridViewState extends State<RandomRecipesGridView> {
  @override
  void initState() {
    super.initState();
    Provider.of<RecipeProvider>(context, listen: false).getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return recipeProvider.isloading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 200, // Set a fixed height for the grid view
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:  min(recipeProvider.recipes.length, 10),
              itemBuilder: (context, index) {
                final recipe = recipeProvider.recipes[index];
                final imageURL = recipe.photoUrl;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(recipe: recipe),
                      ),
                    );
                  },
                  child: Card(
                    child: Center(
                      child: imageURL != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                imageURL,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                          )
                          : const SizedBox(), // Placeholder if image URL is null
                    ),
                  ),
                );
              },
            ),
          );
  }
}
