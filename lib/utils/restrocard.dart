import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class restrocard extends StatelessWidget {
  final String image;
  final String restroname;
  final String subtitle;
  final String time;
  final String rating;
  final void Function() ontap;
  const restrocard(
      {super.key,
      required this.image,
      required this.restroname,
      required this.subtitle,
      required this.time,
      required this.rating,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      topStart: Radius.circular(20)),
                  child: Image.network(
                    image,
                    
                    fit: BoxFit.cover,
                    
                  )),
              Container(
                height: 100,
                width: 360,
                decoration: BoxDecoration(
                  color: secondarycolor,
                  border: Border.all(color: primarycolor),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(20),
                    bottomStart: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              restroname,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: textcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: backgroundcolor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  rating,
                                  style: TextStyle(color: textcolor),
                                ),
                                Icon(Icons.star_border,color: Colors.yellow,size: 20,)
                              ],
                            )),
                            height: 20,
                            width: 50,
                          )
                        ],
                      ),
                      Expanded(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                              fontSize: 14,
                              color: textcolor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.timelapse_rounded),
                          Text(
                            time,
                            style: TextStyle(
                                fontSize: 12,
                                color: textcolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
