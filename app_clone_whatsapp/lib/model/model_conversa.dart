class ConversaModel {
  String _nome;
  String _mensagem;
  String _caminhoFoto;

  //contrutor
  ConversaModel(this._nome, this._mensagem, this._caminhoFoto);
  //Get
  String get nome => _nome;
  String get mensagem => _mensagem;
  String get foto => _caminhoFoto;
  //Set
  set nome(String valor) => _nome = valor;
  set mensagem(String valor) => _mensagem = valor;
  set foto(String valor) => _caminhoFoto = valor;
}
