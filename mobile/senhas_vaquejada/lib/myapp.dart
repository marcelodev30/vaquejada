import 'package:flutter/material.dart';

//import 'home_page.dart';
import 'mark02/views/inicial.views.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(centerTitle: true, color: Colors.red)),
      debugShowCheckedModeBanner: false,
      home: const InicialViews(),
    );
  }
}
