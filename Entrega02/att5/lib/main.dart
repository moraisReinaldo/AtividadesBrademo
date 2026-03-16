import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter layout demo"),
      ),
      body: ListView(
        children: [

          // Imagem
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/20190725_Oeschinensee-Panorama%2C_Kandersteg_%2806540-42_stitch%29.jpg/330px-20190725_Oeschinensee-Panorama%2C_Kandersteg_%2806540-42_stitch%29.jpg',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Título
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Oeschinen Lake Campground',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kandersteg, Switzerland',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                Icon(Icons.star, color: Colors.red),
                Text("41"),
              ],
            ),
          ),

          // Botões
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ButtonSection(icon: Icons.call, label: "CALL"),
                ButtonSection(icon: Icons.near_me, label: "ROUTE"),
                ButtonSection(icon: Icons.share, label: "SHARE"),
              ],
            ),
          ),

          // Texto
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
              'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
              'A gondola ride from Kandersteg, followed by a half-hour walk through '
              'pastures and pine forest, leads you to the lake, which warms to 20 degrees '
              'Celsius in the summer. Activities enjoyed here include rowing, and riding '
              'the summer toboggan run.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final IconData icon;
  final String label;

  const ButtonSection({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}