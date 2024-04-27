import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const WalkthroughPage({super.key, 
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image
          Image.asset(
            image,
            height: 300.0, // Adjust height as needed
          ),
          const SizedBox(height: 30.0),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: textcolor
            ),
          ),
          const SizedBox(height: 20.0),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
              color: primarycolor
            ),
          ),
          const SizedBox(height: 50.0),
          // Optional: Add buttons or indicators for navigation
          // Here you can add buttons or indicators for navigating through pages
          // Example:
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate to the next page
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => NextPage()),
          //     );
          //   },
          //   child: Text('Next'),
          // ),
        ],
      ),
    );
  }
}