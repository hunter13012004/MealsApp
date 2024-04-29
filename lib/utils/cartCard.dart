import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class CartCard extends StatelessWidget {
  final String Dishname;
  final String ImagePath;
  final String? price;
  final String counter;
  final void Function() onPressedminus;
  final void Function() onPressedadd;

  const CartCard({
    super.key,
    required this.Dishname,
    required this.ImagePath,
    this.price,
    required this.onPressedminus,
    required this.onPressedadd,
    this.counter = '1',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: secondarycolor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                ImagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Dishname,
                    style: const TextStyle(
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (price != null)
                    Text(
                      '₹$price',
                      style: const TextStyle(fontSize: 16, color: textcolor),
                    )
                  else
                    const Text(
                      'Price not available',
                      style: TextStyle(fontSize: 16, color: textcolor),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onPressedminus,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  counter,
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: onPressedadd,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
