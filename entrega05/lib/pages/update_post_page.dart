import 'package:flutter/material.dart';
import '../service/Post.dart';
import '../model/Post.dart';
import '../utils/post_utils.dart';

class UpdatePostPage extends StatefulWidget {
  const UpdatePostPage({super.key});

  @override
  State<UpdatePostPage> createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends State<UpdatePostPage> {
  final _service = PostService();
  final _idCtrl = TextEditingController(text: '1');
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  String _result = '';
  bool _loading = false;

  Future<void> _update() async {
    final id = int.tryParse(_idCtrl.text.trim());
    if (id == null ||
        _titleCtrl.text.trim().isEmpty ||
        _bodyCtrl.text.trim().isEmpty) {
      setState(() => _result = 'Preencha todos os campos.');
      return;
    }
    setState(() {
      _loading = true;
      _result = '';
    });
    try {
      final post = await _service.updatePost(Post(
        id: id,
        userId: 1,
        title: _titleCtrl.text.trim(),
        body: _bodyCtrl.text.trim(),
      ));
      setState(
          () => _result = 'Post atualizado!\n\n${postToDisplay(post)}');
    } catch (e) {
      setState(() => _result = 'Erro: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PUT — Atualizar post')),
      body: SingleChildScrollView(
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
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(
                  labelText: 'Novo título', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                  labelText: 'Novo corpo', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _loading ? null : _update,
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Atualizar'),
            ),
            const SizedBox(height: 16),
            if (_result.isNotEmpty) resultBox(_result),
          ],
        ),
      ),
    );
  }
}
