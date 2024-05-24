// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

import 'package:farm/screens/orderscreen.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;

  const PaymentScreen({Key? key, required this.totalPrice}) : super(key: key);

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Price: sh${widget.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                phoneNumber = value;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog();
              },
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: const Text('Are you sure you want to proceed with payment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _processPayment();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _processPayment() {
    // Perform payment processing logic here
    // For example, show a snackbar indicating payment processing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please wait while we process your payment...'),
        duration: Duration(seconds: 2), // Adjust duration as needed
        behavior: SnackBarBehavior.floating, // Display as floating snackbar
      ),
    );

    // Simulate payment processing delay
    Future.delayed(const Duration(seconds: 2), () {
      // After payment is completed, navigate to the order screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderScreen()));
    });
  }
}