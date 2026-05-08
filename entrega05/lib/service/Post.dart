import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Post.dart';

class PostService {
  static const _base = 'jsonplaceholder.typicode.com';

  // GET /posts/:id
  Future<Post> getPost(int id) async {
    final url = Uri.https(_base, '/posts/$id');
    final response = await http.get(url);
    _checkStatus(response);
    return Post.fromJson(jsonDecode(response.body));
  }

  // GET /posts  (lista)
  Future<List<Post>> getPosts({int limit = 10}) async {
    final url = Uri.https(_base, '/posts', {'_limit': '$limit'});
    final response = await http.get(url);
    _checkStatus(response);
    final List data = jsonDecode(response.body);
    return data.map((e) => Post.fromJson(e)).toList();
  }

  // POST /posts
  Future<Post> createPost(Post post) async {
    final url = Uri.https(_base, '/posts');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': post.userId, 'title': post.title, 'body': post.body}),
    );
    _checkStatus(response);
    return Post.fromJson(jsonDecode(response.body));
  }

  // PUT /posts/:id
  Future<Post> updatePost(Post post) async {
    final url = Uri.https(_base, '/posts/${post.id}');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: post.toJsonString(),
    );
    _checkStatus(response);
    return Post.fromJson(jsonDecode(response.body));
  }

  // DELETE /posts/:id
  Future<void> deletePost(int id) async {
    final url = Uri.https(_base, '/posts/$id');
    final response = await http.delete(url);
    _checkStatus(response);
  }

  void _checkStatus(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erro HTTP ${response.statusCode}: ${response.body}');
    }
  }
}