import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/profilepic.dart';

class TopContainer extends StatefulWidget {
  const TopContainer({super.key,});

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> email = [];

  @override
  void initState() {
    super.initState();
    // Split email address to get the first part before '@' if email is not null
    if (user.email != null) {
      email = user.email!.split('@');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(color: primarycolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfilePic(),
              const SizedBox(
                height: 10,
              ),
              Text(
                email.isNotEmpty ? email.first.toUpperCase() : 'Email not found',
                style: const TextStyle(fontSize: 16, color: textcolor,fontWeight: FontWeight.bold),
              ),
              Text(
                user.email.toString(),
                style: const TextStyle(fontSize: 14, color: textcolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
