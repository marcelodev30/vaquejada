// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../views-models/evento.viws-models.dart';

// ignore: must_be_immutable
class CardEvento extends StatelessWidget {
  EventoViwsModels evento;
  CardEvento({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            evento.nomeEvento.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          Image.network(
            evento.urlImag.toString(),
          ),
          Text(
            evento.nomeParque.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.date_range),
            SizedBox(width: 3),
            Text('28 a 30 de Abril 2024'),
          ]),
          SizedBox(
            width: 260,
            child: ListTile(
              title: const Text(
                'Senhas',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Quantidades ${evento.quantidade.toString()}'),
              trailing: Text(
                'R\$ ${evento.valorSenhas}',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Text('Organização: ${evento.organizacao}'),
        ],
      ),
    );
  }
}
