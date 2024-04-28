import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/paymentgatewaypage.dart';
import 'package:mealsapp/utils/cartCard.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({
    super.key,
  });

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  List cartitems = [];
  static int counter = 0;
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
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CartCard(
                      Dishname: 'California',
                      ImagePath: 'assets/images/vegnoodle.jpg',
                      price: '25',
                      onPressedminus: onMinus,
                      onPressedadd: onAdd,
                      counter: counter.toString());
                }),
          ),
           const Center(
        child: Column(
          children: [
            Center(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/images/54770.jpg')),
            )),
            Text('STILL IN DEVELOPMENT MODE!!!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(
                    "Total Amount :",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textcolor),
                  ), Spacer(),
                  Text(
                    "Rs.25",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textcolor),
                  )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentGatewayPage()));},
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primarycolor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: secondarycolor),
                  child: const Center(
                      child: Text(
                    "Proceed To CheckOut",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textcolor),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onMinus() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void onAdd() {
    setState(() {
      counter++;
    });
  }
}
