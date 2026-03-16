import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 2 - Barra de Botões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercicio2(),
    );
  }
}

class Exercicio2 extends StatefulWidget {
  const Exercicio2({Key? key}) : super(key: key);

  @override
  State<Exercicio2> createState() => _Exercicio2State();
}

class _Exercicio2State extends State<Exercicio2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2: Barra de Botões'),
      ),
      body: const Center(
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'CALL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            label: 'ROUTE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}
