// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/mark02/repositories/pedidonumeros.dart';
import 'package:senhas_vaquejada/mark02/views/widgets/button-custom.dart';

class NumerosPage extends StatefulWidget {
  int quantidade;
  NumerosPage({super.key, required this.quantidade});

  @override
  State<NumerosPage> createState() => _NumerosPageState();
}

class _NumerosPageState extends State<NumerosPage> {
  final repostories = PedidoRepositories();

  @override
  void initState() {
    super.initState();
    repostories.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GridView.builder(
            itemCount: widget.quantidade,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              return Container(
                child: repostories.numeros.contains((index, 0))
                    ? ButtonCustom(
                        value: index,
                        btnState: false,
                        color: Colors.orange,
                      )
                    : repostories.numeros.contains((index, 1))
                        ? ButtonCustom(
                            value: index,
                            btnState: false,
                            color: Colors.green,
                          )
                        : ButtonCustom(
                            value: index,
                            btnState: true,
                            color: Colors.blue,
                          ),
              );
            },
          ),
        ),
        const Card(
          elevation: 7,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Disponivel',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
