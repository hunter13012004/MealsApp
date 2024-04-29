import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/provider/cartproivider.dart';
import 'package:mealsapp/services/recipemodel.dart';
import 'package:mealsapp/utils/custombutton.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Recipesmodel recipe;
  
  const DetailsPage({
    super.key, required this.recipe,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: textcolor),
        backgroundColor: Colors.transparent,
        title: const Text('D E T A I L S'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.recipe.photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.recipe.title,
              style: const TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Cuisine: ${widget.recipe.cuisine} | Main Ingredient: ${widget.recipe.mainIngredient}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.recipe.ingredients,
                style: const TextStyle(color: textcolor, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: custombutton(text: 'ADD TO CART', onPressed: (){addtocart();})
            ),
          ],
        ),
      ),
    );
  }

  void addtocart() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    shopProvider.addToCart(widget.recipe, 1); 
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CartsPage()));
  }
}
