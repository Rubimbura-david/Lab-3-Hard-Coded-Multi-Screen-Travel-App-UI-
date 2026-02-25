// Main entry point of the Travel App
// Following lecturer's style - clear structure and comments

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  // Run the app - entry point as taught in Dart basics
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visit Rwanda Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Consistent color theme as required in lab
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Poppins', // Modern font
        brightness: Brightness.light,
      ),
      home: const HomeScreen(),
    );
  }
}
