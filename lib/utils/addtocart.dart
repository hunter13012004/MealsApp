import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class AddtoCart extends StatelessWidget {
  final void Function()? onTap;
  const AddtoCart({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: primarycolor, borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ADD TO CART',style: TextStyle(fontSize: 30,color: backgroundcolor),),
          )),
        ),
      ),
    );
  }
}