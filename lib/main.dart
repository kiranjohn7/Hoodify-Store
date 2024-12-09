import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Color(0xFF273ED4),
        scaffoldBackgroundColor: Color(0xFFFFFDD0),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: HomeScreen(),
    );
  }
}