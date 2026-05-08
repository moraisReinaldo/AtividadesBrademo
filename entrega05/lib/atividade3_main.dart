import 'package:flutter/material.dart';
import 'pages/get_one_page.dart';
import 'pages/get_list_page.dart';
import 'pages/create_post_page.dart';
import 'pages/update_post_page.dart';
import 'pages/delete_post_page.dart';
import 'widgets/operation_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSONPlaceholder CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder CRUD'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          OperationCard(
            icon: Icons.download,
            color: Colors.blue,
            label: 'GET — Buscar post por ID',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const GetOnePage())),
          ),
          OperationCard(
            icon: Icons.list,
            color: Colors.teal,
            label: 'GET — Listar posts',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const GetListPage())),
          ),
          OperationCard(
            icon: Icons.add_circle_outline,
            color: Colors.green,
            label: 'POST — Criar post',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const CreatePostPage())),
          ),
          OperationCard(
            icon: Icons.edit_outlined,
            color: Colors.orange,
            label: 'PUT — Atualizar post',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const UpdatePostPage())),
          ),
          OperationCard(
            icon: Icons.delete_outline,
            color: Colors.red,
            label: 'DELETE — Remover post',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DeletePostPage())),
          ),
        ],
      ),
    );
  }
}
