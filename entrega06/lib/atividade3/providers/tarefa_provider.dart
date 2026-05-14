import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class TarefaProvider extends ChangeNotifier {
  static const String _boxName = 'tarefas';
  static const String _chave = 'lista';

  late final Box _box;
  List<String> _tarefas = [];

  List<String> get tarefas => List.unmodifiable(_tarefas);

  // Construtor: carrega a lista salva no Hive
  TarefaProvider() {
    _box = Hive.box(_boxName);
    _carregar();
  }

  void _carregar() {
    final salvo = _box.get(_chave);
    if (salvo != null) {
      _tarefas = List<String>.from(salvo as List);
    }
  }

  void _persistir() {
    _box.put(_chave, _tarefas.toList());
  }

  void adicionar(String tarefa) {
    final texto = tarefa.trim();
    if (texto.isEmpty) return;
    _tarefas.add(texto);
    _persistir();
    notifyListeners();
  }

  void remover(int index) {
    if (index < 0 || index >= _tarefas.length) return;
    _tarefas.removeAt(index);
    _persistir();
    notifyListeners();
  }
}
