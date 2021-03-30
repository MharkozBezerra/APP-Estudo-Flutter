import 'package:app_lista_tarefa/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/**
 * Singleton da classe de banco de dados
 */
class AnotacaoHelper {
  static final AnotacaoHelper _anotacao = AnotacaoHelper._internal();
  static final String nomeTabela = "anotacao";
  Database _db;

  factory AnotacaoHelper() {
    return _anotacao;
  }
  AnotacaoHelper._internal() {}
//Método de get do  banco de dados
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await iniciarDB();
      return _db;
    }
  }

  _onCreate(Database db, version) async {
    String sql = "CREATE TABLE $nomeTabela( " +
        "id INTEGER PRIMARY KEY AUTOINCREMENT," +
        "titulo VARCHAR," +
        "descricao TEXT," +
        "data DATETIME )";
    await db.execute(sql);
  }

  iniciarDB() async {
    final caminhoDB = await getDatabasesPath();
    final localBancoDados = join(caminhoDB, 'db_minhas_anotcacoes.db');
    //Recupera o banco de dados, local do banco de dados, versão atual, quando for criado o método
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;

    int id = await bancoDados.insert(nomeTabela, anotacao.anotacaoToMap());
    return id;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;

    int id = await bancoDados.update(nomeTabela, anotacao.anotacaoToMap(),
        where: "id = ?", whereArgs: [anotacao.id]);
    return id;
  }

  Future<int> deletarAnotacao(int anotacaoID) async {
    var bancoDados = await db;

    int id = await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [anotacaoID]);
    return id;
  }

  recuperarAnotacao() async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }
}
