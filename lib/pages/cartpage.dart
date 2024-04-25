
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/cartCard.dart';

class CartsPage extends StatefulWidget {

  const CartsPage({super.key, });

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
 int counter = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'MY CART',
          style: TextStyle(color: textcolor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartCard(
          counter: counter.toString(),
          Dishname: ' Veg.Noodles',
          price: '210',
          ImagePath: 'assets/images/vegnoodle.jpg',
          onPressedadd: onAdd,
          onPressedminus:onMinus ,
        ),
        CartCard(
          counter: counter.toString(),
          Dishname: ' Veg.Spring Roll',
          price: '180',
          ImagePath: 'assets/images/springroll.jpg',
          onPressedadd: onAdd,
          onPressedminus:onMinus ,
        )
        ],
      ),
    );
  }
  void onMinus(){
    setState(() {
      if (counter > 0){
      counter--;
      }
    });
  }
  void onAdd(){
    setState(() {
      counter++;
    });
  }
}
