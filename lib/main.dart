import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/salvos_screen.dart';

void main() {
  runApp(const AcordesApp());
}

class AcordesApp extends StatefulWidget {
  const AcordesApp({Key? key}) : super(key: key);

  @override
  State<AcordesApp> createState() => _AcordesAppState();
}

class _AcordesAppState extends State<AcordesApp> {
  int _selectedIndex = 0;

  final List<Widget> _telas = [
    const HomeScreen(),
    const SalvosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Chords',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF154666)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _telas[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFF154666).withOpacity(0.1),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(() => _selectedIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.cloud_outlined),
              selectedIcon: Icon(Icons.cloud, color: Color(0xFF154666)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_outline),
              selectedIcon: Icon(Icons.bookmark, color: Color(0xFF154666)),
              label: 'Salvos',
            ),
          ],
        ),
      ),
    );
  }
}
