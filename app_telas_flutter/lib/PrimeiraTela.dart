import 'package:app_telas_flutter/SegundaTela.dart';
import 'package:flutter/material.dart';

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Ir para próxima tela (2)'),
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SegundaTela()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
