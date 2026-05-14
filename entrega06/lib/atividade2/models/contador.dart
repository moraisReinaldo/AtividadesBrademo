import 'package:flutter/material.dart';

class Contador extends ChangeNotifier {
  int _valor = 0;

  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners();
  }

  void decrementar() {
    _valor--;
    notifyListeners();
  }

  void resetar() {
    _valor = 0;
    notifyListeners();
  }
}
