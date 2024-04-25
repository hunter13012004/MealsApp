import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/model/localdatamodel.dart';
import 'package:mealsapp/model/recipe.dart';
import 'package:mealsapp/model/recipeApi.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/pages/favouritrestro.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/pages/restaurantpage.dart';
import 'package:mealsapp/utils/customdivider.dart';
import 'package:mealsapp/utils/customdrawer.dart';
import 'package:mealsapp/utils/customexploretile.dart';
import 'package:mealsapp/utils/restrocard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 40,
                      color: textcolor,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: primarycolor,
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/myimage.jpg'),
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
                  decoration:
                      BoxDecoration(border: Border.all(color: primarycolor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));},
                        child: Text(
                          'Recommended',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(color: textcolor)),
                        ),
                      ),
                      TextButton(
                          onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>favoriteRestro()));},
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: primarycolor,
                              ),
                              Text(
                                'Favourite',
                                style: TextStyle(color: textcolor),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
             isloading? Center(child: CircularProgressIndicator(),): ListView.builder(
                    itemCount: _recipes.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return restrocard(

                          image: _recipes[index].thumbnail,
                          restroname: _recipes[index].name,
                          subtitle: _recipes[index].name,
                          time: _recipes[index].totaltime,
                          rating: _recipes[index].rating.toString(),
                          ontap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>restroPage( restromodel: recipedata[index],)));});
                    })

                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loguserout() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

  // restrocard(
  //                 image: 'assets/images/springroll.jpg',
  //                 rating: '4.5',
  //                 restroname: 'La Kababiyaa',
  //                 subtitle: 'North Indian',
  //                 time: '30 min',
  //                 ontap: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => restroPage()));
  //                 },
  //               ),
  //               restrocard(
  //                 image: 'assets/images/vegnoodle.jpg',
  //                 rating: '4.0',
  //                 restroname: 'Ching Chinese',
  //                 subtitle: 'Chinese',
  //                 time: '20 min',
  //                 ontap: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => restroPage()));
  //                 },
  //               ),
  // ListView.builder(
  //                   itemCount: restros.length,
  //                   shrinkWrap: true,
  //                   physics: NeverScrollableScrollPhysics(),
  //                   itemBuilder: (context, index) {
  //                     return restrocard(
  //                         image: restros[index].image,
  //                         restroname: restros[index].name,
  //                         subtitle: restros[index].subtitle,
  //                         time: restros[index].time,
  //                         rating: restros[index].rating.toString(),
  //                         ontap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>restroPage()));});
  //                   })