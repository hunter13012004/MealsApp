import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';


class customcontainer extends StatelessWidget {
  final void Function()? onTap;
  final String imagepath;
  const customcontainer({super.key,required this.imagepath,this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: primarycolor),borderRadius: BorderRadius.circular(12)),
        child: Image.asset(imagepath,height: 100,),
      ),
    );
  }
}