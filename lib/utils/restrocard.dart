import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

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
                  borderRadius: const BorderRadiusDirectional.only(
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
                  borderRadius: const BorderRadiusDirectional.only(
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
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: textcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: backgroundcolor,
                                borderRadius: BorderRadius.circular(20)),
                            height: 20,
                            width: 50,
                            child: Center(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  rating,
                                  style: const TextStyle(color: textcolor),
                                ),
                                const Icon(Icons.star_border,color: Colors.yellow,size: 20,)
                              ],
                            )),
                          )
                        ],
                      ),
                      Expanded(
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                              fontSize: 14,
                              color: textcolor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.timelapse_rounded),
                          Text(
                            time,
                            style: const TextStyle(
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
