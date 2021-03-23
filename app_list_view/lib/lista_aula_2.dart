import 'package:flutter/material.dart';

class ListaAula_2 extends StatefulWidget {
  @override
  _ListaAula_2State createState() => _ListaAula_2State();
}

class _ListaAula_2State extends State<ListaAula_2> {
  List _itens = [];
  int _quantidadeMaximaItens = 10;

  void _carregarLista() {
    _itens = [];

    for (int card = 0; card <= _quantidadeMaximaItens; card++) {
      Map<String, dynamic> item = new Map();
      item['titulo'] = "Titulo de número: ${card}";
      item['descricao'] = "descrição do item ${card}";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarLista();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Flutter"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              return ListTile(
                title: Text(_itens[indice]['titulo']),
                subtitle: Text(
                  _itens[indice]['descricao'],
                ),
              );
            }),
      ),
    );
  }
}
