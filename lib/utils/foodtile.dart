import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String image;
  final String restroname;
  final String estimatedtime;
  final String offerText;
  const MyTile(
      {super.key,
      required this.image,
      required this.restroname,
      required this.estimatedtime,
      required this.offerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          //image= as a background
          Image.network(image),

          //heart logo at top left
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //offer text
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                offerText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),

          //name of the shop
          Text(restroname),

          // estimated time with logo
          Row(
            children: [Icon(Icons.timer), Text(estimatedtime)],
          )
        ],
      ),
    );
  }
}
