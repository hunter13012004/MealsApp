import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/pages/favouritrestro.dart';
import 'package:mealsapp/utils/profilepic.dart';

class CustomDrawer extends StatefulWidget {
  final Function()? onPressed;
  const CustomDrawer({
    super.key,
    required this.onPressed,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    

    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      backgroundColor: secondarycolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(color: primarycolor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ProfilePic(),
                   
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Harsh Kashyap',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textcolor),
                    ),
                    Text(user.email.toString(),
                        style: TextStyle(fontSize: 14, color: textcolor))
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          // home button
          Row(
            children: [
              Icon(
                Icons.home,
                color: primarycolor,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'HOME',
                    style: TextStyle(color: textcolor),
                  )),
            ],
          ),
          // Favourite Button
          Row(
            children: [
              Icon(
                Icons.favorite,
                color: primarycolor,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => favoriteRestro()));
                  },
                  child: Text('FAVOURITE', style: TextStyle(color: textcolor))),
            ],
          ),
          // Cart Button

          Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: primarycolor,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartsPage()));
                  },
                  child: Text('MY CART', style: TextStyle(color: textcolor))),
            ],
          ),

          //your order
          Row(
            children: [
              Icon(
                Icons.shopping_bag,
                color: primarycolor,
              ),
              TextButton(
                  onPressed: () {},
                  child:
                      Text('YOUR ORDERS', style: TextStyle(color: textcolor))),
            ],
          ),

          // logout button
          Row(
            children: [
              Icon(
                Icons.logout,
                color: primarycolor,
              ),
              TextButton(
                  onPressed: widget.onPressed,
                  child: Text('LOGOUT', style: TextStyle(color: textcolor))),
            ],
          ),
        ],
      ),
    );
  }
}
