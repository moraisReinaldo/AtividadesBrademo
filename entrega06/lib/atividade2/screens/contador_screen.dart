import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contador.dart';
import '../widgets/botao_contador.dart';

class ContadorScreen extends StatelessWidget {
  const ContadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador com Provider'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Consumer<Contador>(
          builder: (context, contador, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Valor atual',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    '${contador.valor}',
                    key: ValueKey(contador.valor),
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: contador.valor >= 0
                          ? Colors.deepPurple
                          : Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotaoContador(
                      label: 'Decrementar',
                      icon: Icons.remove_circle_outline,
                      color: Colors.redAccent,
                      onPressed: contador.decrementar,
                    ),
                    const SizedBox(width: 24),
                    BotaoContador(
                      label: 'Incrementar',
                      icon: Icons.add_circle_outline,
                      color: Colors.green,
                      onPressed: contador.incrementar,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  onPressed: () => context.read<Contador>().resetar(),
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Resetar'),
                  style: TextButton.styleFrom(foregroundColor: Colors.black45),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
