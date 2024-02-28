import 'package:flutter/material.dart';
import 'package:senhas_vaquejada/pagina2.dart';

//import 'package:trilhaapp/pages/card_page.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text('Senha Digital'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: [
                // CardPage(),
                const MyPage2(),
                Container(
                  color: Colors.black,
                )
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) => controller.jumpToPage(value),
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: 'pag1', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'pag2', icon: Icon(Icons.home)),
              ])
        ],
      ),
    );
  }
}
