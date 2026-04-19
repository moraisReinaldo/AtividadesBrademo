import 'package:flutter/material.dart';

class _Task {
  final String id;
  final String timestamp;
  bool done = false;
  _Task(this.id, this.timestamp);
}

class Exercicio6 extends StatefulWidget {
  const Exercicio6({super.key});
  @override
  State<Exercicio6> createState() => _Exercicio6State();
}

class _Exercicio6State extends State<Exercicio6> {
  final List<_Task> _tasks = [
    _Task('1', 'Task 2022-07-09\n18:08:31.734244'),
    _Task('2', 'Task 2022-07-09\n18:08:32.210300'),
    _Task('3', 'Task 2022-07-09\n18:08:32.629026'),
    _Task('4', 'Task 2022-07-09\n18:08:33.073472'),
    _Task('5', 'Task 2022-07-09\n18:08:33.524172'),
  ];

  int get _uncomplete => _tasks.where((t) => !t.done).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // cabeçalho com botão roxo + texto
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {},
                  child: const Text('View Completed Tasks',
                      style: TextStyle(fontSize: 13)),
                ),
                const SizedBox(height: 6),
                Text(
                  'You have $_uncomplete uncomplete tasks',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),

          // lista de tarefas
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              itemCount: _tasks.length,
              itemBuilder: (context, i) {
                final t = _tasks[i];
                return Card(
                  color: const Color(0xFFFFF9C4), // amarelo claro
                  margin: const EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    title: Text(
                      t.timestamp,
                      style: TextStyle(
                        fontSize: 13,
                        decoration:
                            t.done ? TextDecoration.lineThrough : null,
                        color: t.done ? Colors.grey : Colors.black87,
                      ),
                    ),
                    trailing: Checkbox(
                      value: t.done,
                      onChanged: (_) =>
                          setState(() => t.done = !t.done),
                      activeColor: Colors.blue,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('App de Notas de Tarefas'),
        content:
            const Text('Você está no App de Notas de Tarefas'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
