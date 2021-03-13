import 'package:flutter/material.dart';

class ContatoPage extends StatefulWidget {
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('imagens/detalhe_contato.png'),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Contato",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 10),
                child: Text("Forma de contato"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("Telefone: 14 3372-0000"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Email: conta.atm@atm.com.br"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
