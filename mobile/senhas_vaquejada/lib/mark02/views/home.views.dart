import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/login.page.dart';
import 'package:senhas_vaquejada/mark02/repositories/evento.repositories.dart';
import 'package:senhas_vaquejada/mark02/views/eventopage.dart';
import 'package:senhas_vaquejada/mark02/views/widgets/cardEvento.dart';

//import '../views-models/evento.viws-models.dart';
//import 'widgets/cardEvento.dart';

class HomePagev2 extends StatefulWidget {
  const HomePagev2({super.key});

  @override
  State<HomePagev2> createState() => _HomePagev2State();
}

class _HomePagev2State extends State<HomePagev2> {
  final respositorio = EventoRepositories();

  @override
  void initState() {
    super.initState();
    respositorio.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senhas Digitais'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('A', style: TextStyle(color: Colors.black)),
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: respositorio.eventos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EventoPage(evento: respositorio.eventos[index])));
                },
                child: CardEvento(evento: respositorio.eventos[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
