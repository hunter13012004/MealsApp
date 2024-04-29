import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/pages/favouritrestro.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/pages/fooddetailpage.dart';
import 'package:mealsapp/pages/randomrecipe.dart';
import 'package:mealsapp/provider/imageprovider.dart';
import 'package:mealsapp/services/recipeProvider.dart';
import 'package:mealsapp/utils/customdivider.dart';
import 'package:mealsapp/utils/customdrawer.dart';
import 'package:mealsapp/utils/customexploretile.dart';
import 'package:mealsapp/utils/homeaddress.dart';
import 'package:mealsapp/utils/recipecard.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isFavorite = false;
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RecipeProvider>(context, listen: false).getAllRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<imageProvider>(
      builder: (context, profilepicprovider, child) => Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'M E A L S  A P P',
            style: TextStyle(color: textcolor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartsPage()));
                },
                color: textcolor,
              ),
            ),
          ],
        ),

        // drawer==>
        drawer: CustomDrawer(
          onPressed: loguserout,
        ),
        // body start here==>
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Consumer<RecipeProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AddressPicker(),
                        const SizedBox(
                          width: 230,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: profilepicprovider.image != null
                              ? FileImage(File(profilepicprovider.image!.path))
                              : const AssetImage('assets/images/man.png')
                                  as ImageProvider<Object>,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // SearchBars
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primarycolor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            size: 30,
                            color: secondarycolor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: secondarycolor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSubmitted: (String query) {
                                logger.d('Submitted query: $query');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // For You Offer Tabs
                    const customdivider(dividertext: 'FOR YOU'),
                    const SizedBox(
                      height: 15,
                    ),

                    // Recommended and Favorite buttons with GridView

                    const RandomRecipesGridView(),

                    // Explore tabs
                    const customdivider(dividertext: 'EXPLORE'),
                    const SizedBox(
                      height: 15,
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyExploreTile(
                          offerText: 'Offers 50% Discount',
                          subtitle: 'Flat Discounts',
                          image: '',
                        ),
                        MyExploreTile(
                            offerText: "Play and win",
                            subtitle: 'Exciting prizes',
                            image: '')
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Whats on your mind tab
                    const customdivider(dividertext: 'WHAT\'S ON YOUR MIND'),

                    // Random Recipes Grid View

                    // List of recipes
                    ListView.builder(
                      itemCount: value.recipes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          title: value.recipes[index].title,
                          cookTime: value.recipes[index].cookTime.toString(),
                          rating: value.recipes[index].cuisine,
                          thumbnailUrl: value.recipes[index].photoUrl,
                          onLike: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  recipe: value.recipes[index],
                                ),
                              ),
                            );
                          },
                          isFavorite: isFavorite,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loguserout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
