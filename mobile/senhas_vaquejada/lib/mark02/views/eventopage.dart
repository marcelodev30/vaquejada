// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/mark02/views/evento.numeros.dart';

import '../views-models/evento.viws-models.dart';

class EventoPage extends StatefulWidget {
  EventoViwsModels evento;
  EventoPage({super.key, required this.evento});

  @override
  State<EventoPage> createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text(widget.evento.nomeEvento),
            bottom: const TabBar(tabs: [Icon(Icons.home), Icon(Icons.event)])),
        body: TabBarView(
          children: [
            NumerosPage(
              quantidade: widget.evento.quantidade,
            ),
            Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  widget.evento.nomeEvento.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                Image.network(
                  widget.evento.urlImag.toString(),
                ),
                Text(
                  widget.evento.nomeParque.toString(),
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w700),
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(width: 3),
                      Text('28 a 30 de Abril 2024'),
                    ]),
                SizedBox(
                  width: 260,
                  child: ListTile(
                    title: const Text(
                      'Senhas',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                        'Quantidades ${widget.evento.quantidade.toString()}'),
                    trailing: Text(
                      'R\$ ${widget.evento.valorSenhas}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Text('Organização: ${widget.evento.organizacao}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
