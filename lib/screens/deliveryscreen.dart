// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Dashboard'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Item'),
            subtitle: Text('Tomatoes'),
          ),
          ListTile(
            title: Text('Date Ordered'),
            subtitle: Text('2024-05-15'),
          ),
          ListTile(
            title: Text('Processing'),
            subtitle: Text('In Progress'),
            trailing: Icon(Icons.timelapse),
          ),
          ListTile(
            title: Text('Out for Delivery'),
            subtitle: Text('Pending'),
            trailing: Icon(Icons.directions_car),
          ),
          ListTile(
            title: Text('Delivered'),
            subtitle: Text('Pending'),
            trailing: Icon(Icons.check_circle_outline),
          ),
        ],
      ),
    );
  }
}
