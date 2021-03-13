import 'package:app_cara_ou_coroa/result_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _exibirResultado() {
    var itens = ['cara', 'coroa'];
    var numero = Random().nextInt(itens.length);
    var resultado = itens[numero];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(resultado),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        padding: EdgeInsets.only(top: 36, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('imagens/logo.png'),
            GestureDetector(
              onTap: _exibirResultado,
              child: Image.asset('imagens/botao_jogar.png'),
            ),
          ],
        ),
      ),
    );
  }
}
