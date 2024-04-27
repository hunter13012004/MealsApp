import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class customTextfeild extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final bool obscuretext;
  const customTextfeild({super.key, required this.hinttext, required this.controller,required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primarycolor),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: obscuretext,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: primarycolor),
            hintText: hinttext,
             enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
             focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none)
            
          ),
        ),
      ),
    );
  }
}
