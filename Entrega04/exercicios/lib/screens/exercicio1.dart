import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  static const List<Map<String, String>> _carros = [
    {
      'nome': 'Volkswagen Golf',
      'url': 'https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?w=400&fit=crop',
    },
    {
      'nome': 'BMW M3',
      'url': 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=400&fit=crop',
    },
    {
      'nome': 'Chevrolet Camaro',
      'url': 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=400&fit=crop',
    },
    {
      'nome': 'Ford Mustang',
      'url': 'https://images.unsplash.com/photo-1584345604476-8ec5e12e42dd?w=400&fit=crop',
    },
    {
      'nome': 'BMW M4',
      'url': 'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&fit=crop',
    },
    {
      'nome': 'Porshe 911',
      'url': 'https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?w=400&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 1'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: _carros.length,
        itemBuilder: (context, index) {
          final c = _carros[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Flutter Web: webHtmlElementStrategy contorna CORS
                // usamos o parâmetro só quando disponível (Flutter >= 3.22)
                Image.network(
                  c['url']!,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, prog) => prog == null
                      ? child
                      : Container(
                          color: Colors.grey[200],
                          child: const Center(child: CircularProgressIndicator())),
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.directions_car, size: 50, color: Colors.grey),
                        const SizedBox(height: 4),
                        Text(c['nome']!, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black87, Colors.transparent],
                      ),
                    ),
                    child: Text(
                      c['nome']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
