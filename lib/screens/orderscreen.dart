// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'deliveryscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Order App',
    home: OrderScreen(),
  ));
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future<List<Order>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = fetchOrders();
  }

  Future<List<Order>> fetchOrders() async {
    // Simulating delay to mimic API call
    await Future.delayed(const Duration(seconds: 1));

    // Dummy data
    List<Map<String, dynamic>> dummyData = [
      {
        'orderId': '1',
        'date': '2024-05-13',
        'status': 'Pending',
        'orderItems': ['Cabbage', 'Tomato', 'Maize'],
        'isDelivery': true, // Add isDelivery flag to dummy data
      },
      {
        'orderId': '2',
        'date': '2024-05-12',
        'status': 'Delivered',
        'orderItems': ['Beans', 'Irish potatoes'],
        'isDelivery': false,
      },
      {
        'orderId': '3',
        'date': '2024-05-11',
        'status': 'Cancelled',
        'orderItems': ['Sweet potato', 'Cauliflower'],
        'isDelivery': true,
      },
    ];

    List<Order> orders = [];
    for (var item in dummyData) {
      orders.add(Order.fromJson(item));
    }
    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Order> orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return _buildOrderItem(orders[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildOrderItem(Order order) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Order ID: ${order.orderId}'),
            subtitle: Text('Date: ${order.date} - Status: ${order.status}'),
            trailing: ElevatedButton(
              onPressed: () {
                if (order.isDelivery) {
                  // If delivery was selected, navigate to DeliveryScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryScreen()),
                  );
                } else {
                  // Handle other actions or do nothing
                }
              },
              child: const Text('View Details'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Items:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: order.orderItems.map((item) => Text('- $item')).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Order {
  final String orderId;
  final String date;
  final String status;
  final List<String> orderItems;
  final bool isDelivery; // Add isDelivery field

  Order({
    required this.orderId,
    required this.date,
    required this.status,
    required this.orderItems,
    required this.isDelivery,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      date: json['date'],
      status: json['status'],
      orderItems: List<String>.from(json['orderItems']),
      isDelivery: json['isDelivery'], // Initialize isDelivery field
    );
  }
}
