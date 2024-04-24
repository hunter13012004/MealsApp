import 'package:flutter/material.dart';

class Foryoutile extends StatelessWidget {
  final String OfferText;
  final String subtitle;
  const Foryoutile(
      {super.key,
      required this.OfferText,
      required this.subtitle,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 110, width: 160, 
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(borderRadius: BorderRadius.circular(20)),
        ),
        Text(OfferText,)
      ],
    );
  }
}
