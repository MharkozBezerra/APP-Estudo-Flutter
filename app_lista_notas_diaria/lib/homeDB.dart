import 'package:app_lista_tarefa/helper/AnotacaoHelper.dart';
import 'package:app_lista_tarefa/model/Anotacao.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class HomeDb extends StatefulWidget {
  @override
  _HomeDbState createState() => _HomeDbState();
}

class _HomeDbState extends State<HomeDb> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> listaAnotacoes = List<Anotacao>();
  _exibirTela(Anotacao anotacao) {
    String msgTitulo = "";
    String msgBotao = "";

    if (anotacao == null) {
      msgTitulo = "Adicionar anotações";
      msgBotao = "Salvar";
      tituloController.text = "";
      descricaoController.text = "";
    } else {
      msgTitulo = "Atualizar anotações";
      msgBotao = "Atualizar";
      tituloController.text = anotacao.titulo;
      descricaoController.text = anotacao.descricao;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msgTitulo),
          content: Column(
            //Mostra o tamanho minimo do alert dialog
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: tituloController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Título", hintText: "Digite o título"),
              ),
              TextField(
                controller: descricaoController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  hintText: "Digite a descrição",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () {
                //Salva ou  atualiza dados no banco interno da aplicação.
                _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                //fecha a tela
                Navigator.pop(context);
              },
              child: Text(msgBotao),
            )
          ],
        );
      },
    );
  }

  _exibirConfirmacao(Anotacao anotacao) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Excluir Anotação"),
          content: Column(
            //Mostra o tamanho minimo do alert dialog
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("deseja excluir a anotação: ${anotacao.titulo}, agora?"),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Não"),
            ),
            FlatButton(
              onPressed: () {
                //Salva ou  atualiza dados no banco interno da aplicação.
                _deletarAnotacao(anotacao.id);
                //fecha a tela
                Navigator.pop(context);
              },
              child: Text("Sim"),
            )
          ],
        );
      },
    );
  }

  _salvarAtualizarAnotacao({Anotacao anotacaoSelecionada}) async {
    //recupea informações
    String titulo = tituloController.text;
    String descricao = descricaoController.text;
    String data = DateTime.now().toString();

    if (anotacaoSelecionada == null) {
      Anotacao anotacao = Anotacao(titulo, descricao, data);
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = data;
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    tituloController.clear();
    descricaoController.clear();
    _recuperarAnotacao();
  }

  _deletarAnotacao(int id) async {
    int resultado = await _db.deletarAnotacao(id);

    _recuperarAnotacao();
  }

  _recuperarAnotacao() async {
    List anotacoesRecuperada = await _db.recuperarAnotacao();
    //listaAnotacoes = anotacoesRecuperada;
    List<Anotacao> listaDeAnotacaoTemporaria = List<Anotacao>();
    //Recupera  os itens do banco de dados.
    for (var item in anotacoesRecuperada) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaDeAnotacaoTemporaria.add(anotacao);
    }

    setState(() {
      listaAnotacoes = listaDeAnotacaoTemporaria;
    });
    listaDeAnotacaoTemporaria = null;
  }

  /**
   * Converte a  data do banco de dados para a data do Brasil.
   * utiliza os imports 'package:intl/intl.dart' e 'package:intl/date_symbol_data_local.dart';
   */
  _formatarData(String data) {
    initializeDateFormatting('pt_BR', null);
    var formate = DateFormat("d/M/y H:m"); //#Mostra data abreviada
    // var formate = DateFormat.yMMMMd("pt_BR"); #Mostra data completa
    // Intl.defaultLocale = 'pt_BR';
    DateTime dataConverida = DateTime.parse(data);
    String dataFormatada = formate.format(dataConverida);
    return dataFormatada;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarAnotacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista usando Banco de Dados"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: listaAnotacoes.length,
                itemBuilder: (context, index) {
                  final anotacao = listaAnotacoes[index];
                  return Card(
                    child: ListTile(
                      title: Text(anotacao.titulo),
                      subtitle: Text(
                          "${_formatarData(anotacao.data)} - ${anotacao.descricao}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              //Mesma tela que adiciona
                              _exibirTela(anotacao);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _exibirConfirmacao(anotacao);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          _exibirTela(null);
        },
      ),
    );
  }
}
