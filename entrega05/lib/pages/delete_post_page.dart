import 'package:flutter/material.dart';
import '../service/Post.dart';
import '../utils/post_utils.dart';

class DeletePostPage extends StatefulWidget {
  const DeletePostPage({super.key});

  @override
  State<DeletePostPage> createState() => _DeletePostPageState();
}

class _DeletePostPageState extends State<DeletePostPage> {
  final _service = PostService();
  final _idCtrl = TextEditingController(text: '1');
  String _result = '';
  bool _loading = false;

  Future<void> _delete() async {
    final id = int.tryParse(_idCtrl.text.trim());
    if (id == null) {
      setState(() => _result = 'ID inválido.');
      return;
    }
    setState(() {
      _loading = true;
      _result = '';
    });
    try {
      await _service.deletePost(id);
      setState(() =>
          _result = 'Post #$id removido com sucesso!\n(Status 200 OK)');
    } catch (e) {
      setState(() => _result = 'Erro: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DELETE — Remover post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'ID do post a remover',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _loading ? null : _delete,
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Deletar'),
            ),
            const SizedBox(height: 16),
            if (_result.isNotEmpty) resultBox(_result),
          ],
        ),
      ),
    );
  }
}
