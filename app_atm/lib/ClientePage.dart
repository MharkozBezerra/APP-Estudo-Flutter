import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cliente"),
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
                  Image.asset('imagens/detalhe_cliente.png'),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Cliente",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Image.asset('imagens/cliente1.png'),
              ),
              Text("Empresa de Software"),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Image.asset('imagens/cliente2.png'),
              ),
              Text("Empresa de Auditoria"),
            ],
          ),
        ),
      ),
    );
  }
}
