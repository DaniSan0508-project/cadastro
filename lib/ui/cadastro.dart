import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  String _bemVindo = "Ninguem logado";

  void _entrar() {
    setState(() {
      if (_nomeController.text.isNotEmpty && _senhaController.text.isNotEmpty) {
        _bemVindo = _nomeController.text;
      }
    });
  }

  void _cancelar() {
    _nomeController.clear();
    _senhaController.clear();
    setState(() {
      _bemVindo = "Ninguem logado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Image.asset(
              "assets/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                          hintText: 'Nome',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.5))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.5))),
                      obscureText: true,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: ElevatedButton(
                              onPressed: () => _entrar(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.9),
                              )),
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () => _cancelar(),
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(
                                  fontSize: 16.9,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blueAccent,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _bemVindo != "Ninguem logado"
                        ? "Bem vindo $_bemVindo"
                        : "Ninguem logado",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19.6,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
