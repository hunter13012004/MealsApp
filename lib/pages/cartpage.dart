import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/pages/paymentscreen.dart';
import 'package:mealsapp/provider/cartproivider.dart';
import 'package:mealsapp/services/recipemodel.dart';
import 'package:mealsapp/utils/cartCard.dart';
import 'package:provider/provider.dart';
class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  _CartsPageState createState() => _CartsPageState();
}
class _CartsPageState extends State<CartsPage> {
  double totalAmount = 0; // Initialize totalAmount with 0

  @override
  void initState() {
    super.initState();
    calculateTotalAmount();
  }

  void calculateTotalAmount() {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    totalAmount = shopProvider.calculateTotal();
  }

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
      body: Consumer<ShopProvider>(
        builder: (context, shopProvider, child) {
          final cartItems = shopProvider.cart;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    Recipesmodel item = cartItems[index];
                    final totalPrice = item.price * item.count;
                    return CartCard(
                      Dishname: item.title,
                      ImagePath: item.photoUrl, 
                      price: totalPrice.toString(),
                      onPressedminus: () => onMinus(context, item),
                      onPressedadd: () => onAdd(context, item),
                      counter: item.count.toString(), 
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Total Amount :",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textcolor),
                    ),
                    const Spacer(),
                    Text(
                      "Rs. $totalAmount",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textcolor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  PaytmPaymentPage(totalAmount: totalAmount,),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primarycolor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: secondarycolor,
                      ),
                      child: const Center(
                        child: Text(
                          "Proceed To CheckOut",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textcolor),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void onMinus(BuildContext context, Recipesmodel item) {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    shopProvider.removeFromCart(item);
    calculateTotalAmount();
    setState(() {}); // Call setState to update the UI
  }

  void onAdd(BuildContext context, Recipesmodel item) {
    final shopProvider = Provider.of<ShopProvider>(context, listen: false);
    shopProvider.addToCart(item, 1);
    calculateTotalAmount();
    setState(() {}); // Call setState to update the UI
  }
}
