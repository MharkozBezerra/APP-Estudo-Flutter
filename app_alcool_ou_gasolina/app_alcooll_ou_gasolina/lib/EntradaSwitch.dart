import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _entradaNotificacao = false;
  bool _entradaNotificacaoEmail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados - Switch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text("Receber notificações? "),
              value: _entradaNotificacao,
              onChanged: (bool valor) {
                setState(() {
                  _entradaNotificacao = valor;
                });
              },
            ),
            SwitchListTile(
              title: Text("Receber no Emain? "),
              value: _entradaNotificacaoEmail,
              onChanged: (bool valor) {
                setState(() {
                  _entradaNotificacaoEmail = valor;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
