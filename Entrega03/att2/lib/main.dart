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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Widget'),
                const SizedBox(height: 8),
                Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 40),
            Theme(
              data: ThemeData(
                scaffoldBackgroundColor: Colors.grey[400], 
              ),
              child: Container(
                
                padding: const EdgeInsets.all(20),
                color: Colors.grey[400],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("ThemeData Sobrescreve"),
                    const SizedBox(height: 10),
                    const Text('Widget'),
                    const SizedBox(height: 8),
                    Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.amber[300],
                        border: Border.all(color: Colors.yellow, width: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}