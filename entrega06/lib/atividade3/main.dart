// ============================================================
// ATIVIDADE 3 — Provider + Hive: Lista de Tarefas Persistente
// ============================================================

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/tarefa_provider.dart';
import 'screens/tarefas_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tarefas');
  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider(),
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
      title: 'Lista de Tarefas',
      home: TarefasScreen(),
    );
  }
}
