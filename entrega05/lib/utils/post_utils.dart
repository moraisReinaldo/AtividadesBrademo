import 'package:flutter/material.dart';
import '../model/Post.dart';

Widget resultBox(String text) => Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SelectableText(text, style: const TextStyle(fontFamily: 'monospace')),
    );

String postToDisplay(Post p) =>
    'ID: ${p.id}\nUserID: ${p.userId}\nTítulo: ${p.title}\nCorpo: ${p.body}';
