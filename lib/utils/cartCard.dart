import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class CartCard extends StatelessWidget {
  final String Dishname;
  final String ImagePath;
  final String price;
  final String counter;
  final void Function() onPressedminus;
  final void Function() onPressedadd;
  const CartCard({
    super.key,
    required this.Dishname,
    required this.ImagePath,
    required this.price,
    required this.onPressedminus,
    required this.onPressedadd, required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 80,
          width: 400,
          decoration: BoxDecoration(
              color: secondarycolor,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ImagePath,
                        
                        height: 50,
                      ))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Dishname,
                    style: TextStyle(
                        fontSize: 18,
                        color: textcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('₹'+price,
                      style: TextStyle(fontSize: 16, color: textcolor))
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: backgroundcolor),
                  child: IconButton(
                      onPressed: onPressedminus, icon: Icon(Icons.remove))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  counter,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: backgroundcolor),
                  child: IconButton(
                      onPressed: onPressedadd, icon: Icon(Icons.add))),
            ],
          )),
    );
  }
}
