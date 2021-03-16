import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controladore = new TextEditingController();
  String _preco = "0,00";

  void _buscarBitCoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _preco = (retorno['BRL']['buy']).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Text(
                        'Valor é atualizado a cada 15 minutos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Image.asset('imagens/bitcoin.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Text(
                        "R\$: " + _preco,
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                    RaisedButton(
                      onPressed: _buscarBitCoin,
                      child: Text(
                        "Atualizar",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.orange,
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
