import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controlarTxt = new TextEditingController();
  String _textoMemoria = "Nasa Salvo ainda";

  _salvar() async {
    String valorDigitado = controlarTxt.text;
    //Recupera o objeto.
    final prefs = await SharedPreferences.getInstance();
    //Salva na memoria interna
    await prefs.setString('nome', valorDigitado);
  }

  _recuperar() async {
    String valorRecuperado = controlarTxt.text;
    //Recupera o valor do objeto.
    final prefs = await SharedPreferences.getInstance();
    //Salva na memoria interna - verifica se est nulo
    valorRecuperado = prefs.getString('nome') ?? "Sem valor!";

    setState(() {
      _textoMemoria = valorRecuperado;
    });
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    //Exluir informação da memória.
    prefs.remove('nome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoMemoria,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration(labelText: "Digite algo ai, vai......"),
              controller: controlarTxt,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Salvar",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _salvar),
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Ler", style: TextStyle(fontSize: 20)),
                    onPressed: _recuperar),
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Remover", style: TextStyle(fontSize: 20)),
                    onPressed: _remover)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
