// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/cartpage.dart';
import 'package:mealsapp/pages/favouritrestro.dart';
import 'package:mealsapp/utils/drawercontainer.dart';

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
            const TopContainer(),
           
      
            const SizedBox(
              height: 10,
            ),
      
            // home button
            Row(
              children: [
                const Icon(
                  Icons.home,
                  color: primarycolor,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'HOME',
                      style: TextStyle(color: textcolor),
                    )),
              ],
            ),
            // Favourite Button
            Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: primarycolor,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const favoriteRestro()));
                    },
                    child: const Text('FAVOURITE', style: TextStyle(color: textcolor))),
              ],
            ),
            // Cart Button
      
            Row(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: primarycolor,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const CartsPage()));
                    },
                    child: const Text('MY CART', style: TextStyle(color: textcolor))),
              ],
            ),
      
            //your order
            Row(
              children: [
                const Icon(
                  Icons.shopping_bag,
                  color: primarycolor,
                ),
                TextButton(
                    onPressed: () {},
                    child:
                        const Text('YOUR ORDERS', style: TextStyle(color: textcolor))),
              ],
            ),
      
            // logout button
            Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: primarycolor,
                ),
                TextButton(
                    onPressed: widget.onPressed,
                    child: const Text('LOGOUT', style: TextStyle(color: textcolor))),
              ],
            ),
          ],
        ),
      );
      }
      
    }