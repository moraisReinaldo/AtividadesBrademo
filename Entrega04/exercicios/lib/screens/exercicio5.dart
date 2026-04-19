import 'package:flutter/material.dart';

class Exercicio5 extends StatefulWidget {
  const Exercicio5({super.key});
  @override
  State<Exercicio5> createState() => _Exercicio5State();
}

class _Exercicio5State extends State<Exercicio5> {
  int _tab = 0;
  bool _open = false;

  // abas exatamente como no enunciado: This, Is, A, Bottom, Bar
  static const _labels = ['This', 'Is', 'A', 'Bottom', 'Bar'];
  static const _icons = [
    Icons.menu,
    Icons.star_border,
    Icons.add, // placeholder (centro = FAB)
    Icons.grid_view,
    Icons.notifications_none,
  ];

  void _selectTab(int i) => setState(() {
        _tab = i;
        _open = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // conteúdo principal
          Center(
            child: Text(
              'TAB: $_tab',
              style: const TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          // opções flutuantes acima do FAB
          if (_open)
            Positioned(
              bottom: 80,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _fabOption(Icons.email_outlined, 'Email', Colors.orange),
                  const SizedBox(height: 12),
                  _fabOption(Icons.message_outlined, 'Message', Colors.green),
                  const SizedBox(height: 12),
                  _fabOption(Icons.phone_outlined, 'Phone', Colors.blue),
                ],
              ),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => setState(() => _open = !_open),
        child: AnimatedRotation(
          turns: _open ? 0.125 : 0,
          duration: const Duration(milliseconds: 200),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // lado esquerdo: This, Is
              _barBtn(0),
              _barBtn(1),
              const SizedBox(width: 48), // espaço do FAB
              // lado direito: Bottom, Bar (skip A = índice 2)
              _barBtn(3),
              _barBtn(4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _barBtn(int index) {
    final selected = _tab == index;
    return GestureDetector(
      onTap: () => _selectTab(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_icons[index],
                color: selected ? Colors.blue : Colors.grey, size: 22),
            Text(_labels[index],
                style: TextStyle(
                    fontSize: 10,
                    color: selected ? Colors.blue : Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _fabOption(IconData icon, String label, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Text(label, style: const TextStyle(fontSize: 13)),
        ),
        const SizedBox(width: 8),
        FloatingActionButton.small(
          heroTag: label,
          backgroundColor: color,
          onPressed: () => setState(() => _open = false),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ],
    );
  }
}
