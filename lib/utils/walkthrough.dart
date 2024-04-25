import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  WalkthroughPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image
          Image.asset(
            image,
            height: 300.0, // Adjust height as needed
          ),
          SizedBox(height: 30.0),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: textcolor
            ),
          ),
          SizedBox(height: 20.0),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: primarycolor
            ),
          ),
          SizedBox(height: 50.0),
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