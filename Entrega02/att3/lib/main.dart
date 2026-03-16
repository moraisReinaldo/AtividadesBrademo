import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 3 - Stack e Positioned',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercicio3(),
    );
  }
}

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Positioned Widget'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white)
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Stack(
            children: [
              // Container 1 - Verde (base)
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 200,
                  height: 150,
                  color: Colors.green,
                  child: const Text('Green', style: TextStyle(color: Colors.white)),
                ),
              ),
              // Container 2 - Vermelho (sobreposto)
              Positioned(
                top: 100,
                left: 120,
                child: Container(
                  width: 200,
                  height: 150,
                  color: Colors.red,
                  child: const Text('Red', style: TextStyle(color: Colors.white)),
                ),
              ),
              // Container 3 - Roxo/Magenta (sobreposto)
              Positioned(
                top: 150,
                left: 190,
                child: Container(
                  width: 200,
                  height: 150,
                  color: Colors.purple,
                  child: const Text('Purple', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
