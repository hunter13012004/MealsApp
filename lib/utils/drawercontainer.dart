import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/profilepic.dart';

class topContainer extends StatefulWidget {
  const topContainer({super.key});

  @override
  State<topContainer> createState() => _topContainerState();
}

class _topContainerState extends State<topContainer> {
  final user = FirebaseAuth.instance.currentUser!;

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
                    
                    Text(user.email.toString(),
                        style: const TextStyle(fontSize: 14, color: textcolor))
                  ],
                ),
              ),
            ],
          );
        } 
      }