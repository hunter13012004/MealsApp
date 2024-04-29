import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/pages/fooddetailpage.dart';
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
  List<int>? filterIndex;
  bool Isfavorurite = false ;
  @override
  void initState() {
    // TODO: implement initState
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
          title: Text(
            'M E A L S  A P P',
            style: TextStyle(color: textcolor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartsPage()));
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Consumer<RecipeProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                       AddressPicker(),
                       
                        SizedBox(
                          width: 230,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: profilepicprovider.image != null
                              ? FileImage(File(profilepicprovider.image!.path))
                              : AssetImage('assets/images/man.png')
                                  as ImageProvider<Object>,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // SearchBars
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primarycolor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: secondarycolor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: secondarycolor),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // For You Offer Tabs
                    customdivider(dividertext: 'FOR YOU'),
                    SizedBox(
                      height: 15,
                    ),

                    // still need work  recommended and favorite tabs
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: secondarycolor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                              },
                              icon: Icon(
                                Icons.recommend,
                                color: textcolor,
                              )),
                          Container(
                              height: 50,
                              child: VerticalDivider(
                                thickness: 2,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: textcolor,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // Foryoutile(OfferText: 'KFC', subtitle: '',),
                    SizedBox(
                      height: 15,
                    ),
                    // explore tabs
                    customdivider(dividertext: 'EXPLORE'),
                    SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyExploreTile(
                          OfferText: 'Offers 50% off',
                          subtitle: 'Flat Discounts',
                          image: '',
                        ),
                        MyExploreTile(
                            OfferText: 'Play & Win',
                            subtitle: 'Exiting Prizes',
                            image: '')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // whats on your mind tab
                    customdivider(dividertext: 'WHAT\S ON YOUR MIND'),
                    ListView.builder(
                        itemCount: value.recipes.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            title: value.recipes[index].title,
                            cookTime: value.recipes[index].cookTime.toString(),
                            rating: value.recipes[index].cuisine,
                            thumbnailUrl: value.recipes[index].photoUrl,
                            onlike:(){
                              setState(() {
                                addtolike();
                              });
                            },
                            icon: Isfavorurite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                            recipe: value.recipes[index],
                                          )));
                            },
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addtolike(){

    setState(() {
      Isfavorurite = !Isfavorurite;
      Isfavorurite = !Isfavorurite;

    });
  }

  void loguserout() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
