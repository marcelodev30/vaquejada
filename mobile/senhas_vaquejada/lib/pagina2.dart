import 'package:flutter/material.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({
    super.key,
  });

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  List<dynamic> numeros = [
    (15, 0),
    (46, 0),
    (59, 1),
    (24, 0),
    (38, 1),
    (22, 1)
  ];

  List<String> listaNumero = [];
  void add(String value) {
    setState(() {
      if (listaNumero.contains(value)) {
        listaNumero.remove(value);
      } else {
        listaNumero.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Text(listaNumero.toString()),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: GridView.builder(
              itemCount: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                    child: numeros.contains((index, 0))
                        ? Mytest(
                            value: index,
                            colar: Colors.orange,
                            btnstate: false,
                          )
                        : numeros.contains((index, 1))
                            ? Mytest(
                                value: index,
                                colar: Colors.green,
                                btnstate: false,
                              )
                            : Mytest(
                                value: index,
                                colar: Colors.blue,
                                btnstate: true,
                                setValue: (value) => add(value)));
              },
            ),
          ),
          Positioned(
              height: 200,
              width: 200,
              bottom: MediaQuery.of(context).size.height * 0.10,
              //right: 10,
              left: MediaQuery.of(context).size.width * 0.25,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 8,
                  color: Colors.white,
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Disponivel',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                            SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Reservado',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                            SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Comprado',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                            SizedBox(height: 8),
                          ])))),
          Positioned(
              bottom: 30,
              height: 50,
              right: MediaQuery.of(context).size.width * 0.24,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.green)),
                child: const Text('Confirmar',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text('Nome do parque'),
                          content: const Wrap(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Puxador',
                                  hintText: 'Puxador',
                                ),
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: 'Esterira'),
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: 'Representação'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Sair')),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return AlertDialog(
                                          alignment: Alignment.center,
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          title:
                                              const Text('Forma de pagamento'),
                                          content: pagePagamento(
                                            numeros: listaNumero,
                                            valor: 50,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Sair')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Confirmar'))
                                          ],
                                        );
                                      });
                                },
                                child: const Text('Pagar'))
                          ],
                        );
                      });
                },
              ))
        ],
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class pagePagamento extends StatefulWidget {
  List? numeros;
  int? valor;
  pagePagamento({super.key, this.numeros, this.valor});

  @override
  State<pagePagamento> createState() => _pagePagamentoState();
}

// ignore: camel_case_types, must_be_immutable
class _pagePagamentoState extends State<pagePagamento> {
  var formaPagamentoSelecionado = '';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Numeros comprados: ${widget.numeros.toString().replaceAll('[', '').replaceAll(']', '')}',
        ),
        Text(
          'Total R\$: ${widget.numeros!.length * widget.valor!}',
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(1),
                  value: 'Dinheiro',
                  title: const Text('Dinheiro'),
                  groupValue: formaPagamentoSelecionado,
                  onChanged: (value) {
                    setState(() {
                      formaPagamentoSelecionado = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(1),
                  value: 'Pix',
                  title: const Text(
                    'Pix',
                  ),
                  groupValue: formaPagamentoSelecionado,
                  onChanged: (value) {
                    setState(() {
                      formaPagamentoSelecionado = value.toString();
                    });
                  },
                ),
              ),
            ]),
        const TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
              labelText: 'Telefone para Contato',
              hintText: 'Telefone'),
        )
      ],
    );
  }
}

class Carrinho extends StatelessWidget {
  const Carrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// ignore: camel_case_types, must_be_immutable
class Mytest extends StatefulWidget {
  int value;
  Color colar;
  bool? btnstate = true;
  Function(String value)? setValue;
  Mytest(
      {super.key,
      required this.value,
      required this.colar,
      required this.btnstate,
      this.setValue});

  @override
  State<Mytest> createState() => _MytestState();
}

class _MytestState extends State<Mytest> {
  bool selecionado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStatePropertyAll(widget.colar)),
          onPressed: widget.btnstate!
              ? () {
                  setState(() {
                    selecionado = !selecionado;
                    selecionado
                        ? widget.colar = Colors.indigo
                        : widget.colar = Colors.blue;
                  });
                  widget.setValue!(widget.value.toString());
                }
              : null,
          child: Text(
            widget.value.toString(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
