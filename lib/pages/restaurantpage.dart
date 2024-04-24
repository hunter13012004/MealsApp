import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/recipecard.dart';

class restroPage extends StatefulWidget {
  const restroPage({super.key});

  @override
  State<restroPage> createState() => _restroPageState();
}

class _restroPageState extends State<restroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
     
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primarycolor.withOpacity(0.5) , secondarycolor.withOpacity(0.2)], begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))
                ],
              ),
              Text('LA KABABIYAA',style: TextStyle(fontSize: 30),),
              Text('North Indian',style: TextStyle(fontSize: 16),),
              Text('Rating',style: TextStyle(fontSize: 16),),
              Text('Dwarka Sec - 7',style: TextStyle(fontSize: 16),),
              
              RecipeCard(title: 'butter chicken', cookTime: '50', rating:'5', thumbnailUrl: 'assets/images/vegnoodle.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}