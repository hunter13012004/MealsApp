import 'package:flutter/material.dart';
import 'package:mealsapp/constants/colorspicker.dart';

class PaymentIntegrationPage extends StatefulWidget {
  const PaymentIntegrationPage({super.key});

  @override
  _PaymentIntegrationPageState createState() => _PaymentIntegrationPageState();
}

class _PaymentIntegrationPageState extends State<PaymentIntegrationPage> {
  String? _selectedPaymentMethod;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Payment Integration',
          style: TextStyle(color: textcolor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              items: ['Paytm', 'UPI', 'Card'].map((method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
            ),
            if (_selectedPaymentMethod == 'Card') ...[
              const SizedBox(height: 20),
              const Text(
                'Enter Card Details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Expiry Date (MM/YY)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process payment based on selected method and entered details
                _processPayment();
              },
              child: const Text('Proceed to Pay'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment() {
    // Dummy method to simulate payment processing
    print('Selected Payment Method: $_selectedPaymentMethod');
    if (_selectedPaymentMethod == 'Card') {
      print('Card Number: ${_cardNumberController.text}');
      print('Expiry Date: ${_expiryDateController.text}');
      print('CVV: ${_cvvController.text}');
    }
    // Add your logic to handle payment based on the selected method and entered details
  }
}
