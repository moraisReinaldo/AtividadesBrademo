import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 1 - Interface Gráfica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercicio1(),
    );
  }
}

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is Fun!'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Hi Mom 👋',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
