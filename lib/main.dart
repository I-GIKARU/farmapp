// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farm/screens/loadingscreen.dart'; // Import your SplashScreen here
import 'package:firebase_core/firebase_core.dart';
import 'package:farm/screens/shopscreen.dart'; // Import your CartProvider class here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), // Provide your CartProvider
        // Add more providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Set to system to follow device theme
      darkTheme: ThemeData.dark(), // Define your dark theme
      home: SplashScreen(), // Set your SplashScreen as the home screen
    );
  }
}
