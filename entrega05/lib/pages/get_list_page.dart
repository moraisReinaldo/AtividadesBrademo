import 'package:flutter/material.dart';
import '../service/Post.dart';
import '../model/Post.dart';

class GetListPage extends StatefulWidget {
  const GetListPage({super.key});

  @override
  State<GetListPage> createState() => _GetListPageState();
}

class _GetListPageState extends State<GetListPage> {
  final _service = PostService();
  List<Post> _posts = [];
  bool _loading = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future<void> _fetchList() async {
    setState(() {
      _loading = true;
      _error = '';
    });
    try {
      final list = await _service.getPosts(limit: 10);
      setState(() => _posts = list);
    } catch (e) {
      setState(() => _error = 'Erro: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET — Lista de posts'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchList)
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text(_error))
              : ListView.separated(
                  itemCount: _posts.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final p = _posts[i];
                    return ListTile(
                      leading: CircleAvatar(child: Text('${p.id}')),
                      title: Text(p.title,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(p.body,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                    );
                  },
                ),
    );
  }
}
