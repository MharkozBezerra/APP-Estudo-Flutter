import 'package:flutter/material.dart';

class ServicoPage extends StatefulWidget {
  @override
  _ServicoPageState createState() => _ServicoPageState();
}

class _ServicoPageState extends State<ServicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Serviço"),
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
                  Image.asset('imagens/detalhe_servico.png'),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Serviços",
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
                padding: EdgeInsets.only(left: 16),
                child: Text("Consultoria"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("Calculo de preços"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("Acompanhamento de Projetos"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
