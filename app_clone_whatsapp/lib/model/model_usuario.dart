import 'package:flutter/material.dart';

class UsuarioModel {
  String _idUsuario = '';
  String _nome = '';
  String _email = '';
  String _senha = '';
  String _foto = '';
  //String _sexo;

  UsuarioModel();
  String get id => _idUsuario;
  String get nome => _nome;
  String get senha => _senha;
  String get email => _email;
  String get foto => _foto;
  //String get sexo => _sexo;
  String get _usuarioID => _idUsuario;

  set nome(String valor) => _nome = valor;
  set senha(String valor) => _senha = valor;
  set email(String valor) => _email = valor;
  set id(String valor) => _idUsuario = valor;
  set foto(String valor) => _foto = valor;
  /**
   * Cria um map do tipo usuário
   */
  Map<String, dynamic> usuarioParaMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'email': this.email,
    };
    return map;
  }
}
