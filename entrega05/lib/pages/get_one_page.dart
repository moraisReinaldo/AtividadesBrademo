import 'package:flutter/material.dart';
import '../service/Post.dart';
import '../utils/post_utils.dart';

class GetOnePage extends StatefulWidget {
  const GetOnePage({super.key});

  @override
  State<GetOnePage> createState() => _GetOnePageState();
}

class _GetOnePageState extends State<GetOnePage> {
  final _service = PostService();
  final _idCtrl = TextEditingController(text: '1');
  String _result = '';
  bool _loading = false;

  Future<void> _fetch() async {
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
      final post = await _service.getPost(id);
      setState(() => _result = postToDisplay(post));
    } catch (e) {
      setState(() => _result = 'Erro: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GET — Buscar post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'ID do post', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _loading ? null : _fetch,
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            if (_result.isNotEmpty) resultBox(_result),
          ],
        ),
      ),
    );
  }
}
