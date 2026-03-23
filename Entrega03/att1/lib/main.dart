import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Widget',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.yellow,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}