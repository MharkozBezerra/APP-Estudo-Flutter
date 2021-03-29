import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  TextEditingController _controllerAddTarefa = TextEditingController();
  Map<String, dynamic> _ultimaTarefaRemovida = new Map();

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
    //Cria o arquivos e informa o local de salvamento.
  }

  //Recupera os aquivos
  Future<File> _getFile() async {
    //Recupera o diretório da aplicação.
    final diretorio = await getApplicationDocumentsDirectory();

    //Cria o arquivos e informa o local de salvamento.
    return File("${diretorio.path}/dados.json");
  }

  _salvarDados() async {
    //Recupera o diretório da aplicação.
    final diretorio = await getApplicationDocumentsDirectory();

    //Cria o arquivos e informa o local de salvamento.
    var arquivo = await _getFile();

    //Converte a lista em json
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _salvarTarefa() {
    String textoDigitado = _controllerAddTarefa.text;

    //Cria um map de dados para ser retornados titulo da tarefa / obrigatóriedade / conclusão
    Map<String, dynamic> tarefa = new Map();

    tarefa['titulo'] = textoDigitado;
    tarefa['subtitulo'] = "Obrigatório";
    tarefa['concluida'] = false;

    //Atualiza o a lista
    setState(() {
      //Adiciona o item na tarefa.
      _listaTarefas.add(tarefa);
    });
    //Salva os dados na memória do dispositivo.
    _salvarDados();
    _controllerAddTarefa.text = "";
  }

  Widget criarItemLista(context, indice) {
    //final item = _listaTarefas[indice]['titulo'];
    var item = DateTime.now().millisecondsSinceEpoch.toString();
    return Dismissible(
      key: Key(item),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        //Recupera o último item excluído
        _ultimaTarefaRemovida = _listaTarefas[indice];
        //Remova lista da lista
        _listaTarefas.removeAt(indice);
        _salvarDados();

        //sback bar
        final snacknar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
          content: Text("Tarefa removida"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              //Recupera na mesma posição
              setState(() {
                _listaTarefas.insert(indice, _ultimaTarefaRemovida);
              });
              _salvarDados();
            },
          ),
        );
        Scaffold.of(context).showSnackBar(snacknar);
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_listaTarefas[indice]['titulo']),
        value: _listaTarefas[indice]['concluida'],
        onChanged: (valor) {
          setState(() {
            _listaTarefas[indice]['concluida'] = valor;
          });
          _salvarDados();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Salva as tarefas.

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas com Action Bar"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          // floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          elevation: 6,
          // icon: Icon(Icons.add_shopping_cart),
          // label: Text("Adicionar"),
          // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Adicionar  Tarefas"),
                    content: TextField(
                      controller: _controllerAddTarefa,
                      decoration:
                          InputDecoration(labelText: "Digite sua tafera"),
                      onChanged: (text) {},
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      FlatButton(
                        child: Text("Salvar"),
                        onPressed: () {
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          }),
      // bottomNavigationBar: BottomAppBar(
      //   //shape: CircularNotchedRectangle(),
      //   child: Row(
      //     children: <Widget>[
      //       IconButton(icon: Icon(Icons.menu), onPressed: () {})
      //     ],
      //   ),
      // ),
    );
  }
}
