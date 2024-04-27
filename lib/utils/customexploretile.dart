import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class MyExploreTile extends StatelessWidget {
  final String OfferText;
  final String subtitle;
  final String image;
  const MyExploreTile(
      {super.key,
      required this.OfferText,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: secondarycolor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                OfferText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(subtitle),
              const Icon(Icons.keyboard_double_arrow_right_rounded)
            ],
          ),
        ));
  }
}
