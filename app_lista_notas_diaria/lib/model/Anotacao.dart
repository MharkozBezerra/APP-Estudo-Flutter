class Anotacao {
  int id;
  String titulo;
  String descricao;
  String data;

  //Cria-se um objeto de Anotação
  Anotacao(this.titulo, this.descricao, this.data);

  Anotacao.fromMap(Map map) {
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.descricao = map['descricao'];
    this.data = map['data'];
  }

  Map anotacaoToMap() {
    Map<String, dynamic> map = {
      'titulo': this.titulo,
      'descricao': this.descricao,
      'data': this.data,
    };
    //Adiciona o id, caso exista ou seja informado.
    if (this.id != null) {
      map['id'] = this.id;
    }
    return map;
  }
}
