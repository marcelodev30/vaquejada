// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  int value;
  Color? color;
  bool? btnState = true;
  ButtonCustom(
      {super.key, required this.value, required this.btnState, this.color});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  bool selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStatePropertyAll(widget.color)),
          child: Text(
            widget.value.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () {
            widget.btnState!
                ? () {
                    setState(() {
                      selecionado = !selecionado;
                      selecionado
                          ? widget.color = Colors.indigo
                          : widget.color = Colors.blue;
                    });
                  }
                : null;
          }),
    );
  }
}
