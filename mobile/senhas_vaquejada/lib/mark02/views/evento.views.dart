import 'package:flutter/material.dart';

class EventoViews extends StatelessWidget {
  EventoViews({super.key});
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'Nome do evento')),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Nome do parque'),
                    validator: (value) => value!.isEmpty ? 'Ivalindo' : null,
                  ),
                  const SizedBox(height: 15),
                  const Text('Senhas',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Valor',
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Quandidade',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Enviar',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
