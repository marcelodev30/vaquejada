import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/mark02/views/home.views.dart';

class InicialViews extends StatefulWidget {
  const InicialViews({super.key});

  @override
  State<InicialViews> createState() => _InicialViewsState();
}

class _InicialViewsState extends State<InicialViews> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePagev2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.red, Color.fromARGB(255, 210, 55, 55)],
        )),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Senhas Digitais',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w800)),
            SizedBox(height: 40),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
