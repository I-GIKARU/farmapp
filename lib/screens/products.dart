// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../pages/chatscreen.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildCard('Vegetables', 'Explore a colorful world of fresh, locally-sourced vegetables, ready to fill your cart with health and flavor.', 'assets/images/vegetables.png'),
                _buildCard('Fruits', 'Explore a colorful world of fresh, locally-sourced fruits, ready to fill your cart with health and flavor.', 'assets/images/fruits.png'),
                _buildCard('Others', 'Explore a colorful world of fresh, locally-sourced products, ready to fill your cart with health and flavor.', 'assets/images/others.png'),
                const SizedBox(height: 0.0), // Add some spacing between products and services
                const Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildService('Selling', 'Bringing the farm to your table, we offer a bountiful selection of fresh, farm-grown produce, harvested with care and delivered to your doorstep for a taste of authentic, farm-fresh goodness.'),
                _buildService('Deliveries', 'Bringing the farm to your table, we offer a bountiful selection of fresh, farm-grown produce, harvested with care and delivered to your doorstep for a taste of authentic, farm-fresh goodness.'),
                _buildService('Advertising', 'Bringing the farm to your table, we offer a bountiful selection of fresh, farm-grown produce, harvested with care and delivered to your doorstep for a taste of authentic, farm-fresh goodness.'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'All rights Reserved © 2024 Nyeri National Polytechnic\nCreated by Karani-Ken',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
          // Add your chat logic here
        },
        tooltip: 'Chat With Mkulima Assistant',
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget _buildCard(String title, String description, String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 0.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildService(String title, String description) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(description),
    );
  }
}
