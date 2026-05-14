// ============================================================
// ATIVIDADE 2 — Provider: Contador com ChangeNotifier
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/contador.dart';
import 'screens/contador_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Contador(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorScreen(),
    );
  }
}
