import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class ModoScreen extends StatefulWidget {
  const ModoScreen({super.key});
  @override
  State<ModoScreen> createState() => _ModoScreenState();
}

class _ModoScreenState extends State<ModoScreen> {
  final Box _box = Hive.box('settings');

  bool get _isRelax => _box.get('isRelax', defaultValue: true) as bool;

  void _alternar() {
    _box.put('isRelax', !_isRelax);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool relax = _isRelax;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      color: relax ? const Color(0xFF1565C0) : const Color(0xFF2E7D32),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                relax ? Icons.self_improvement : Icons.bolt,
                size: 80,
                color: Colors.white70,
              ),
              const SizedBox(height: 16),
              Text(
                relax ? 'Modo Relax' : 'Modo Focado',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                relax ? 'Respira fundo e descansa 🌿' : 'Hora de produzir! 🚀',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor:
                      relax ? const Color(0xFF1565C0) : const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: _alternar,
                icon: const Icon(Icons.swap_horiz),
                label: Text(
                    relax ? 'Ativar Modo Focado' : 'Ativar Modo Relax'),
              ),
              const SizedBox(height: 20),
              Text(
                'Estado salvo com Hive ✓',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
