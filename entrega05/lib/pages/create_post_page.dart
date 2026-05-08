import 'package:flutter/material.dart';
import '../service/Post.dart';
import '../model/Post.dart';
import '../utils/post_utils.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _service = PostService();
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();
  String _result = '';
  bool _loading = false;

  Future<void> _create() async {
    if (_titleCtrl.text.trim().isEmpty || _bodyCtrl.text.trim().isEmpty) {
      setState(() => _result = 'Preencha título e corpo.');
      return;
    }
    setState(() {
      _loading = true;
      _result = '';
    });
    try {
      final post = await _service.createPost(Post(
        userId: 1,
        title: _titleCtrl.text.trim(),
        body: _bodyCtrl.text.trim(),
      ));
      setState(() => _result =
          'Post criado com sucesso!\n\n${postToDisplay(post)}');
    } catch (e) {
      setState(() => _result = 'Erro: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POST — Criar post')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(
                  labelText: 'Título', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                  labelText: 'Corpo', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _loading ? null : _create,
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Criar'),
            ),
            const SizedBox(height: 16),
            if (_result.isNotEmpty) resultBox(_result),
          ],
        ),
      ),
    );
  }
}
