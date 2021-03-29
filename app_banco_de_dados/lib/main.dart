import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; //Para trabalhar com banco de dados.
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBandoDeDados() async {
    final caminhoDB = await getDatabasesPath();
    final localDB = join(caminhoDB, "banco.db");

    var retorno =
        await openDatabase(localDB, version: 1, onCreate: (db, dbVersaoAtual) {
      String sql =
          "CREATE  TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome  VARCHAR(250), idade INTEGER )";
      db.execute(sql);
    });

    return retorno;
  }

  _salvar() async {
    Database db = await _recuperarBandoDeDados();

    Map<String, dynamic> dadosUsuario = {
      'nome': "Nikolly Emanuelly",
      'idade': 6
    };
    //Retorna o id do usuário salvo
    int id = await db.insert('usuarios', dadosUsuario);
  }

  _listarUsuario() async {
    Database db = await _recuperarBandoDeDados();

    String sql = "SELECT * FROM usuarios";
    List usuarios = await db.rawQuery(sql);

    for (var usuario in usuarios) {
      print("id: " +
          usuario['id'].toString() +
          "nome: " +
          usuario['nome'] +
          "idade: " +
          usuario['idade'].toString());
    }
  }

  _listarUsuarioPeloId(int id) async {
    Database db = await _recuperarBandoDeDados();

    String sql = "SELECT * FROM usuarios";
    List usuarios = await db.query('usuarios',
        columns: ['id', 'nome', 'idade'], where: 'id = ?', whereArgs: [id]);

    for (var usuario in usuarios) {
      print("id: " +
          usuario['id'].toString() +
          "nome: " +
          usuario['nome'] +
          "idade: " +
          usuario['idade'].toString());
    }
  }

  _excluirUsuarioPeloId(int id) async {
    Database db = await _recuperarBandoDeDados();
    int retorno = await db.delete("usuarios", where: "id = ?", whereArgs: [id]);
    return retorno;
  }

  _atualizarUsuarioPeloId(int id) async {
    Database db = await _recuperarBandoDeDados();

    Map<String, dynamic> dadosUsuario = {
      'nome': "Gabrielly Emanuelly",
      'idade': 0
    };
    int retorno = await db.update(
        'usuarios', // <--- Tabela
        dadosUsuario, // <--- Dados que será atualizado
        where: 'id =?', // <--- Condição
        whereArgs: [id] // <--- Argumento
        );
    return retorno; // <--- Retorno após a execução do bloco de código.
  }

  @override
  Widget build(BuildContext context) {
    _salvar();
    _listarUsuario();
    _listarUsuarioPeloId(1);
    _atualizarUsuarioPeloId(1);
    _excluirUsuarioPeloId(1);
//Conjunto de operação criado pelo para teste.
    return Container();
  }
}
