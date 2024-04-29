import 'package:flutter/material.dart';
import 'package:mealsapp/pages/checkoutpage.dart';

class PaytmPaymentPage extends StatelessWidget {
  final double totalAmount;

  const PaytmPaymentPage({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paytm Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Paytm.png', // Replace with actual Paytm logo image
                width: 200,
              ),
              const SizedBox(height: 20),
              Text(
                'Total Amount: \$${totalAmount.toStringAsFixed(2)}', // Display total amount dynamically
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const checkout()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    'Proceed to Paytm',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
