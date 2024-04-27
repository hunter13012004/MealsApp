
import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/utils/cartCard.dart';

class CartsPage extends StatefulWidget {

  const CartsPage({super.key, });

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  List cartitems = [];
 static int counter = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'MY CART',
          style: TextStyle(color: textcolor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
         ListView.builder(itemCount: cartitems.length,itemBuilder: (context,index){
          return CartCard(Dishname: '', ImagePath: '', price: '', onPressedminus: (){}, onPressedadd:(){}, counter: '');
         } )
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
