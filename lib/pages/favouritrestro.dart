import 'package:flutter/material.dart';

class favoriteRestro extends StatefulWidget {
  const favoriteRestro({super.key});

  @override
  State<favoriteRestro> createState() => _favoriteRestroState();
}

class _favoriteRestroState extends State<favoriteRestro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/images/54770.jpg')),
            )),
            Text('STILL IN DEVELOPMENT MODE!!!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}