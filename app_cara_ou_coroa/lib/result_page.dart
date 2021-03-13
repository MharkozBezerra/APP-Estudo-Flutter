import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  String valor;

  ResultPage(this.valor);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void _voltar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String _caminhoImagem = '';
    if (widget.valor == 'cara') {
      _caminhoImagem = 'imagens/moeda_cara.png';
    } else {
      _caminhoImagem = 'imagens/moeda_coroa.png';
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        padding: EdgeInsets.only(top: 36, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(_caminhoImagem),
            GestureDetector(
              onTap: _voltar,
              child: Image.asset('imagens/botao_voltar.png'),
            ),
          ],
        ),
      ),
    );
  }
}
