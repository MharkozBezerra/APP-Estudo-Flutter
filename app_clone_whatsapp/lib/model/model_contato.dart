class ContatoModel {
  String _nome;
  String _telefone;
  String _caminhoFoto;

  //contrutor
  ContatoModel(this._nome, this._telefone, this._caminhoFoto);
  //Get
  String get nome => _nome;
  String get telefone => _telefone;
  String get foto => _caminhoFoto;
  //Set
  set nome(String valor) => _nome = valor;
  set telefone(String valor) => _telefone = valor;
  set foto(String valor) => _caminhoFoto = valor;
}
