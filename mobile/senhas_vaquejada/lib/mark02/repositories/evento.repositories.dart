import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/mark02/views-models/evento.viws-models.dart';

class EventoRepositories extends ChangeNotifier {
  List<EventoViwsModels> eventos = [
    EventoViwsModels(
      'Evento top',
      'Parque sei la',
      'test muito top',
      100,
      'https://static.vecteezy.com/ti/vetor-gratis/t2/100981-piloto-de-touro-vetor.jpg',
      50.00,
    ),
    EventoViwsModels(
      'Evento kkk',
      'Parque sei la',
      'test dd top',
      50,
      'https://static.vecteezy.com/ti/vetor-gratis/t2/100981-piloto-de-touro-vetor.jpg',
      20.00,
    ),
    EventoViwsModels(
      'Evento kkk',
      'Parque sei la',
      'test dd top',
      150,
      'https://static.vecteezy.com/ti/vetor-gratis/t2/100981-piloto-de-touro-vetor.jpg',
      20.00,
    ),
  ];

  void add(EventoViwsModels evento) {
    eventos.add(evento);
    notifyListeners();
  }
}
