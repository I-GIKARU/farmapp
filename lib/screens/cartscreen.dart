// ignore_for_file: use_key_in_widget_constructors

import 'package:farm/screens/paymentscreen.dart';
import 'package:farm/screens/shopscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartItems = cartProvider.cartItems;
    double calculateTotalPrice() {
      var cartProvider = Provider.of<CartProvider>(context, listen: false);
      double totalPrice = 0.0;
      for (var item in cartProvider.cartItems) {
        totalPrice += double.parse(item.price);
      }
      return totalPrice;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text('Your cart is empty.'),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              cartItems[index].imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cartItems[index].name),
            subtitle: Text('Price: ${cartItems[index].price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                cartProvider.removeFromCart(cartItems[index]);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${_calculateTotal(cartItems)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Choose An Option'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Calculate total price including any additional fees (if applicable)
                            double totalPrice = calculateTotalPrice(); // Assuming calculateTotalPrice() function is defined

                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(totalPrice: totalPrice),
                              ),
                            );
                          },
                          child: const Text('Collect'),
                        ),

                        const Padding(padding: EdgeInsets.all(8.0)),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // Delivery options with their fees
                                Map<String, double> deliveryOptions = {
                                  '3NK': 120.0,
                                  'G5S': 130.0,
                                  '6NTE': 125.0,
                                  'cargo courier': 135.0,
                                };

                                return AlertDialog(
                                  title: const Text('Delivery Options'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: deliveryOptions.keys.map((String option) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            // Handle delivery option selection
                                            double deliveryFee = deliveryOptions[option]!;
                                            // Calculate total price including delivery fee
                                            double totalPrice = calculateTotalPrice() + deliveryFee;
                                            Navigator.of(context).pop(); // Close the dialog
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PaymentScreen(totalPrice: totalPrice),
                                              ),
                                            );
                                          },
                                          child: Text('$option: sh${deliveryOptions[option]}'),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text('Delivery'),
                        ),



                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Checkout'),
        ),

            ],
          ),
        ),
      ),
    );
  }

  String _calculateTotal(List<Product> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += double.parse(item.price);
    }
    return total.toStringAsFixed(2); // Format total with 2 decimal places
  }
}
