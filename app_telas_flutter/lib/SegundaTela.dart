import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            Text("Segunda Tela"),
          ],
        ),
      ),
    );
  }
}
