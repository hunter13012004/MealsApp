import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/pages/homepage.dart';
import 'package:mealsapp/pages/splashscreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if(snapshot.hasData){
        return Homepage();
      }
      else{
        return SplashScreen();
      }
      
    },stream:FirebaseAuth.instance.authStateChanges() ,);
  }
}