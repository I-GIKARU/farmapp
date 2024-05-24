// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pages/chatscreen.dart';

class InteractionsScreen extends StatefulWidget {
  @override
  InteractionsScreenState createState() => InteractionsScreenState();
}

class InteractionsScreenState extends State<InteractionsScreen> {
  final String apiKey = '7eaebed7de7b36c4a91ef4f9378f4235';
  final String city = 'Nyeri'; // Example city

  String? weatherDescription;
  double? temperature;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        weatherDescription = data['weather'][0]['description'];
        temperature = data['main']['temp'].toDouble();
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather updates
            const Text(
              'Weather Updates',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            if (weatherDescription != null && temperature != null)
              Column(
                children: [
                  Text(
                    'Weather: $weatherDescription',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Temperature: $temperature°C',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            const SizedBox(height: 16.0),
            // Weather predictions for the week

            // Add weather prediction widgets here
            const SizedBox(height: 16.0),
            // Farmer's profile
            const Text(
              'Farmer\'s Profile',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Add farmer's profile details here
            const ListTile(
              title: Text('Name: farmer'),
              subtitle: Text('Farmer'),
              // Add other farmer profile details here
            ),
            const SizedBox(height: 16.0),
            // Chat option
            ElevatedButton(
              onPressed: () {
                // Handle chat option
              },
              child: const Text('Chat with Farmer'),
            ),
            const SizedBox(height: 16.0),
            // Blogs section
            const Text(
              'Blogs',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Add blogs widgets here
            // Each blog post can be represented using ListTile or a custom widget
            // You can also implement a feature to upload blogs
          ],
        ),
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
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
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
      ),
    );
  }
}
