// ignore_for_file: use_super_parameters

import 'package:farm/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:farm/screens/shopscreen.dart';
import 'package:farm/screens/farmerscreen.dart';
import 'package:farm/screens/customerscreen.dart';
import 'package:farm/screens/interactionsscreen.dart';

import 'cartscreen.dart';
import '../pages/chatscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Fresh',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/farmunitylogo.png'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Show a hover menu with options "cart" and "shop"
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: <PopupMenuEntry>[
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Cart'),
                      onTap: () {
                        // Navigate to the cart screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.shop),
                      title: const Text('Shop'),
                      onTap: () {
                        // Navigate to the cart screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopScreen()));
                      },
                    ),
                  ),
                ],
              );
            },
            child: const Text('Market Place'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the Interactions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InteractionsScreen()),
              );
            },
            child: const Text('Interactions'),
          ),
          ElevatedButton(
            onPressed: () {
              // Show a dialog or bottom sheet to choose between Farmer and Customer
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Farmer'),
                        onTap: () {
                          // Navigate to the cart screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FarmerScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: const Text('Customer'),
                        onTap: () {
                          // Navigate to the cart screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerScreen()));
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Sign up'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Our Community Support Agricultural Platform!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 500.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background.png'), // Provide your background image path here
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text(
                  'Our platform serves as a vibrant hub connecting farmers, consumers, and enthusiasts, fostering a sustainable and supportive ecosystem for agriculture.',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color on top of the background image
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Products'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
            ),
            const SizedBox(height: 20.0), // Add some spacing between sections
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cultivating Excellence: Our Farm-to-Table Story\nAt Farm Fresh Fiesta, we are passionate about providing you with the finest farm-fresh produce. Our journey begins at local farms, where dedicated growers cultivate the very best nature has to offer. With care and commitment, we select the ripest, most flavorful treasures to share with you. Our mission is simple: to bring the farm to your table. We bridge the gap between producers and consumers, ensuring that you have access to a vibrant selection of freshly harvested, locally-sourced fruits and vegetables. We take pride in our role as your trusted source for farm produce. Our commitment to quality, sustainability, and supporting local agriculture runs deep. With every bite, you can taste the dedication of our partner farmers and the love we put into delivering nature\'s best straight to your kitchen.',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipOval(
                                  child:Image.asset(
                                    'assets/images/delivery.png', // Provide your image path here
                                    width: 190.0,
                                    height: 190.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/delivery2.png', // Provide your image path here
                                    width: 190.0,
                                    height: 190.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'All rights Reserved © 2024 aNyeri National Polytechnic\nCreated by Karani-Ken',
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );

        },
        tooltip: 'Chat With Mkulima Assistant',
        child: const Icon(Icons.chat),
      ),
    );
  }
}