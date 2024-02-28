import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilitySenha = false;
  final fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: fromkey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.45),
              const Text(''),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Ex: test@gmail.com',
                    labelText: 'Login',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo))),
                validator: (value) => value!.isEmpty ? '' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                  obscureText: visibilitySenha,
                  validator: (value) => value!.isEmpty ? '' : null,
                  decoration: InputDecoration(
                    hintText: 'Ex: xxxxxxxxxx',
                    labelText: 'Senha',
                    focusedBorder: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      child: Icon(visibilitySenha
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onTap: () {
                        setState(() {
                          visibilitySenha = !visibilitySenha;
                        });
                      },
                    ),
                  )),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    if (fromkey.currentState!.validate()) {
                      fromkey.currentState!.save();
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
