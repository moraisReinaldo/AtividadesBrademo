import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tarefa_provider.dart';
import '../widgets/campo_nova_tarefa.dart';
import '../widgets/tarefa_tile.dart';
import '../widgets/estado_vazio.dart';

class TarefasScreen extends StatelessWidget {
  const TarefasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          Consumer<TarefaProvider>(
            builder: (_, p, child) => Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${p.tarefas.length} item(s)',
                    style:
                        const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<TarefaProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              CampoNovaTarefa(provider: provider),
              Expanded(
                child: provider.tarefas.isEmpty
                    ? const EstadoVazio()
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: provider.tarefas.length,
                        separatorBuilder: (_, child) => const Divider(
                            height: 1, indent: 16, endIndent: 16),
                        itemBuilder: (context, index) {
                          return TarefaTile(
                            titulo: provider.tarefas[index],
                            numero: index + 1,
                            onRemover: () => provider.remover(index),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
