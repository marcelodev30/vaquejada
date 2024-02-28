import 'package:flutter/material.dart';

class NumerosRepostories extends ChangeNotifier {
  List<String> listaNumero = [];
  void add(String value) {
    if (listaNumero.contains(value)) {
      listaNumero.remove(value);
      notifyListeners();
    } else {
      listaNumero.add(value);
      notifyListeners();
    }
  }
}
