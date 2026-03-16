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
      title: 'Exercicio Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Insert Image Example'),
            backgroundColor: Colors.blue,
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Imagem menor
              SizedBox(
                width: 200,
                height: 120,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    'https://quatrorodas.abril.com.br/wp-content/uploads/2021/04/Corsa-Wind-modelo-1997-da-Chevrolet._1-C%C3%B3pia-e1658777380285.jpg?quality=70&strip=info&w=1280&h=720&crop=1',
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Imagem maior
              SizedBox(
                width: 300,
                height: 200,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    'https://quatrorodas.abril.com.br/wp-content/uploads/2016/11/5658bddb52657372a11e3a0bchevrolet-celta-advantage-1.jpeg?quality=70&strip=all&w=1024&crop=1',
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}