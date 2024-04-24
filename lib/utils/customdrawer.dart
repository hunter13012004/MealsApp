import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';

class CustomDrawer extends StatelessWidget {
  final Function()? onPressed;
  const CustomDrawer({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      backgroundColor: secondarycolor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              height: 250,
              color: primarycolor,
              child: Padding(
                padding:  EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 70,
                      backgroundImage:
                          AssetImage('assets/images/myimage.jpg'),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    
                    Text(
                      'Harsh Kashyap',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(user.email!)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            // home button
            Row(
              children: [
                Icon(Icons.home,color: primarycolor,),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('HOME',style: TextStyle(color: textcolor),)),
              ],
            ),
            // Favourite Button
            Row(
              children: [
                Icon(Icons.favorite,color: primarycolor,),
                TextButton(onPressed: (){}, child: Text('FAVOURITE',style: TextStyle(color: textcolor))),
              ],
            ),
            // Cart Button
            
            Row(
              children: [
                Icon(Icons.shopping_cart,color: primarycolor,),
                TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> CartsPage()));}, child: Text('MY CART',style: TextStyle(color: textcolor))),
              ],
            ),

            //your order 
            Row(
              children: [
                Icon(Icons.shopping_bag,color: primarycolor,),
                TextButton(onPressed: (){}, child: Text('YOUR ORDERS',style: TextStyle(color: textcolor))),
              ],
            ),

            // logout button
            Row(
              children: [
                Icon(Icons.logout,color: primarycolor,),
                TextButton(onPressed:onPressed, child: Text('LOGOUT',style: TextStyle(color: textcolor))),
              ],
            ),
          ],
        ),
      );
  }
  
}