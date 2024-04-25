import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/homepage.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/pages/walkthrough.dart';
import 'package:mealsapp/utils/walkthrough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WalkthroughScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }
}
