import 'package:flutter/material.dart';

class ListaAula_1 extends StatefulWidget {
  @override
  _ListaAula_1State createState() => _ListaAula_1State();
}

class _ListaAula_1State extends State<ListaAula_1> {
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
