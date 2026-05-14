import 'package:flutter/material.dart';

class TarefaTile extends StatelessWidget {
  final String titulo;
  final int numero;
  final VoidCallback onRemover;

  const TarefaTile({
    super.key,
    required this.titulo,
    required this.numero,
    required this.onRemover,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.teal.shade100,
        child: Text(
          '$numero',
          style: const TextStyle(
              fontSize: 13, color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(titulo, style: const TextStyle(fontSize: 16)),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
        tooltip: 'Remover tarefa',
        onPressed: onRemover,
      ),
    );
  }
}
