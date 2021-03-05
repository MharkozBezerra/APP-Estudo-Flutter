import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  String _escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados - RadioButton"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RadioListTile(
                title: Text("Mulher"),
                value: 'homen',
                groupValue: _escolhaUsuario,
                onChanged: (String escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
            RadioListTile(
              title: Text("Mulher"),
              value: 'mulher',
              groupValue: _escolhaUsuario,
              onChanged: (String escolha) {
                setState(() {
                  _escolhaUsuario = escolha;
                });
              },
            ),
            Text(_escolhaUsuario),
          ],
        ),
      ),
    );
  }
}
