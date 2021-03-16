import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  TextEditingController controlador = new TextEditingController();
  void _recuperarCEP() async {
    //Seta o cep
    String cep = controlador.text;
    //Seta a url de pesquisa
    String url = "http://viacep.com.br/ws/${cep}/json/";
    //Seta  classe Respose
    http.Response response;
    // Recebe o resultado, é preciso informar o  await "espera"
    response = await http.get(url);
    //Decodifica as informações para json
    Map<String, dynamic> retorno = json.decode(response.body);
    //Recupera dados
    String logradouro = retorno['logradouro'];
    String cidade = retorno['localidade'];
    String bairro = retorno['bairro'];
    String uf = retorno['uf'];

    setState(() {
      _resultado =
          "Resposta: Logradouro ${logradouro}, Cidade: ${cidade},  Bairro: ${bairro}, UF: ${uf}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de API Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controlador,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o cep desejado ex: 123456789"),
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCEP,
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
