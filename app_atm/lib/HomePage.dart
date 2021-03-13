import 'package:app_atm/EmpresaPage.dart';
import 'package:flutter/material.dart';

import 'ClientePage.dart';
import 'ContatoPage.dart';
import 'ServicoPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _abrirEmpresa() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmpresaPage(),
        ));
  }

  void _abrirServico() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServicoPage(),
        ));
  }

  void _abrirCliente() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientePage(),
        ));
  }

  void _abrirContato() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContatoPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('imagens/logo.png'),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirEmpresa,
                    child: Image.asset('imagens/menu_empresa.png'),
                  ),
                  GestureDetector(
                    onTap: _abrirServico,
                    child: Image.asset('imagens/menu_servico.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirCliente,
                    child: Image.asset('imagens/menu_cliente.png'),
                  ),
                  GestureDetector(
                    onTap: _abrirContato,
                    child: Image.asset('imagens/menu_contato.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
