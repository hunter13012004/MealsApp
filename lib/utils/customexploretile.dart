import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class MyExploreTile extends StatelessWidget {
  final String offerText;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  const MyExploreTile({
    super.key,
    required this.offerText,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Execute onTap callback when tile is tapped
      child: Container(
        height: 90,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: secondarycolor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offerText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
