
import 'package:flutter/material.dart';
import 'package:know_chords/views/home/home.dart';

class navApp extends StatefulWidget {
  const navApp({Key? key}) : super(key: key);

  @override
  _navAppState createState() => _navAppState();
}

class _navAppState extends State<navApp> {
  int _selectedIndex = 0; // Índice da tela selecionada

  static const List<Widget> _widgetOptions = <Widget>[
    TelaInicial(), // Substitua pelas suas telas
    TelaExplorar(),
    TelaPerfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Center(
    child: Text(
      'knowChords ️',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    ),
    ),


    backgroundColor: Theme.of(context).primaryColor,
    ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explorar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}


class TelaExplorar extends StatelessWidget {
  const TelaExplorar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tela Explorar'));
  }
}


class TelaPerfil extends StatelessWidget {
  const TelaPerfil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tela Perfil'));
  }
}

