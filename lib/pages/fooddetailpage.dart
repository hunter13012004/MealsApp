import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/model/recipe.dart';

import 'package:mealsapp/utils/addtocart.dart';
import 'package:provider/provider.dart';

import '../provider/cartproivider.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipes;
  
  const DetailsPage({
    super.key,  required this.recipes,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final List<Recipe> recipes = [] ;

  static List<Recipe> details = details; 
  int quantity = 0 ;
  final String description =
      'Indulge in a culinary journey with our Grilled Salmon served with a tantalizing Lemon Herb Butter sauce. Sourced from the freshest catch of the day, our salmon fillets are expertly seasoned and grilled to perfection, resulting in a succulent, flaky texture that melts in your mouth. Accompanied by a medley of seasonal vegetables, each bite offers a burst of vibrant flavors and wholesome goodness. Drizzled generously with our signature Lemon Herb Butter sauce, infused with zesty lemon and fragrant herbs, this dish elevates your dining experience to new heights. Whether you\'re a seafood enthusiast or a connoisseur of fine dining, our Grilled Salmon with Lemon Herb Butter promises to tantalize your taste buds and leave you craving for more';
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
      body: Stack(
        children: [Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(widget.recipes.thumbnail)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
             widget.recipes.name,
              style: const TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description,
                  style: const TextStyle(color: textcolor, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.bottomCenter,
                child: AddtoCart(
                  onTap: addtocart,
                ),
              ),
            ),
          ],
        ),]
      ),
    );
  }
  void addtocart(){
   final shop =context.read<shopProvider>();

   shop.addtocart(widget.recipes,quantity);
  }
}
