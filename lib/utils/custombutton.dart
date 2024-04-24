import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class custombutton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const custombutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(color: primarycolor,borderRadius: BorderRadius.circular(12)),
      child: TextButton(onPressed: onPressed, child: Text(text,style: TextStyle(color:Colors.white,fontSize: 20),)),
    );
  }
}
