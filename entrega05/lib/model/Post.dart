import 'dart:convert';

class Post {
  final int? id;
  final int userId;
  final String title;
  final String body;

  Post({this.id, required this.userId, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        userId: json['userId'],
        title: json['title'] ?? '',
        body: json['body'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };

  String toJsonString() => jsonEncode(toMap());
}