import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/firebase_options.dart';
import 'package:mealsapp/pages/homepage.dart';
import 'package:mealsapp/pages/loginpage.dart';
import 'package:mealsapp/pages/splashscreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}