import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 0;
  String stringValor = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados - Switch"),
      ),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            Slider(
              value: _valor,
              label: stringValor,
              divisions: 10,
              min: 0,
              max: 100,
              onChanged: (double novoValor) {
                setState(() {
                  _valor = novoValor;
                  (novoValor < 100)
                      ? stringValor = novoValor.toInt().toString()
                      : stringValor = "Máximo";
                });
              },
            ),
            Text(stringValor),
          ],
        ),
      ),
    );
  }
}
