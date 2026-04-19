import 'package:flutter/material.dart';

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        title: const Text('Exercício 2'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: orientation == Orientation.portrait
                ? _Portrait()
                : _Landscape(),
          );
        },
      ),
    );
  }
}

// ── itens da lista ────────────────────────────────────────────────
const _langs = ['Dart', 'JavaScript', 'PHP', 'C++'];

// ── portrait ──────────────────────────────────────────────────────
class _Portrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _btn('BUTTON 1')),
              const SizedBox(width: 8),
              Expanded(child: _btn('BUTTON 2')),
            ],
          ),
          const SizedBox(height: 12),
          ..._langs.map((l) => _langTile(l)),
        ],
      ),
    );
  }
}

// ── landscape ─────────────────────────────────────────────────────
class _Landscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // coluna esquerda: header + botões
          SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _header(),
                const SizedBox(height: 16),
                _btn('BUTTON 1'),
                const SizedBox(height: 8),
                _btn('BUTTON 2'),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // divisor vertical
          Container(width: 1, height: 160, color: Colors.grey[700]),
          const SizedBox(width: 24),
          // coluna direita: lista
          SizedBox(
            width: 160,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _langs.map((l) => _langTile(l)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── widgets compartilhados ────────────────────────────────────────
Widget _header() {
  return Column(
    children: [
      Text('Responsive Layouts',
          style: TextStyle(color: Colors.grey[500], fontSize: 11)),
      const SizedBox(height: 4),
      const Text('Cheetah Coding',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    ],
  );
}

Widget _btn(String label) {
  return SizedBox(
    width: double.infinity,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white54),
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {},
      child: Text(label, style: const TextStyle(fontSize: 12)),
    ),
  );
}

Widget _langTile(String label) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 4),
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey[800]!)),
    ),
    child: Text(label,
        style: const TextStyle(color: Colors.white, fontSize: 14)),
  );
}
