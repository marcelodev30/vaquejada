import 'package:flutter/material.dart';

class PedidoRepositories extends ChangeNotifier {
  List<dynamic> numeros = [
    (15, 1),
    (38, 1),
    (24, 0),
    (32, 1),
    (55, 0),
    (2, 1),
    (75, 0),
  ];

  List<String> listaNumeros = [];
  void add(String value) {
    if (!listaNumeros.contains(value)) {
      listaNumeros.add(value);
      notifyListeners();
    } else {
      listaNumeros.remove(value);
      notifyListeners();
    }
  }
}
