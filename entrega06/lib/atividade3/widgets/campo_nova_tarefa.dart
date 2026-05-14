import 'package:flutter/material.dart';

import '../providers/tarefa_provider.dart';

class CampoNovaTarefa extends StatefulWidget {
  final TarefaProvider provider;
  const CampoNovaTarefa({super.key, required this.provider});

  @override
  State<CampoNovaTarefa> createState() => _CampoNovaTarefaState();
}

class _CampoNovaTarefaState extends State<CampoNovaTarefa> {
  final _controller = TextEditingController();

  void _adicionar() {
    widget.provider.adicionar(_controller.text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _adicionar(),
              decoration: InputDecoration(
                hintText: 'Nova tarefa...',
                prefixIcon: const Icon(Icons.add_task, color: Colors.teal),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _adicionar,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
