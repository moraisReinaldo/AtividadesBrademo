import 'package:flutter/material.dart';
import 'screens/exercicio1.dart';
import 'screens/exercicio2.dart';
import 'screens/exercicio3.dart';
import 'screens/exercicio4.dart';
import 'screens/exercicio5.dart';
import 'screens/exercicio6.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Exercício 1', 'GridView com imagens', const Exercicio1()),
      ('Exercício 2', 'Layout Responsivo', const Exercicio2()),
      ('Exercício 3', 'Constraints de Layout', const Exercicio3()),
      ('Exercício 4', 'Form + SnackBar', const Exercicio4()),
      ('Exercício 5', 'FAB + BottomAppBar', const Exercicio5()),
      ('Exercício 6', 'ListView + AlertDialog', const Exercicio6()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 5 — Exercícios Flutter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final (titulo, desc, tela) = items[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('${i + 1}',
                    style: const TextStyle(color: Colors.white)),
              ),
              title: Text(titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(desc),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => tela)),
            ),
          );
        },
      ),
    );
  }
}
