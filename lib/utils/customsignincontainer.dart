import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';


class customcontainer extends StatelessWidget {
  final String imagepath;
  const customcontainer({super.key,required this.imagepath });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: primarycolor),borderRadius: BorderRadius.circular(12)),
      child: Image.asset(imagepath,height: 100,),
    );
  }
}