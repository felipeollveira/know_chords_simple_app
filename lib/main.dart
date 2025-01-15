import 'package:flutter/material.dart';
import 'views/partials/appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF154666),
        scaffoldBackgroundColor: const Color(0xFFF5FBFF),
        fontFamily: 'Roboto',
      ),
      home: const navApp(),
    );
  }
}

