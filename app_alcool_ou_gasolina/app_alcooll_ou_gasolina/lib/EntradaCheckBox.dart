import 'package:flutter/material.dart';

class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  bool _valorBrasil = false;
  bool _valorJapao = false;
  bool _valorSexo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text('Comida Brasileira'),
              subtitle: Text('A Melhor comida da região'),
              value: _valorBrasil,
              onChanged: (bool valor) {
                setState(() {
                  _valorBrasil = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Comida Japonesa'),
              subtitle: Text('Aqui não sapão'),
              value: _valorJapao,
              onChanged: (bool valor) {
                setState(() {
                  _valorJapao = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Sexo'),
              subtitle: Text('Comer é bom, mais fazer sexo é melhor ainda'),
              value: _valorSexo,
              onChanged: (bool valor) {
                setState(() {
                  _valorSexo = valor;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
