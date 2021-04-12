import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControllerUsuario {
  String _stringRetorno = "";
  FirebaseFirestore banco = FirebaseFirestore.instance;

  Future<bool> cadastrarUsuario(UsuarioModel usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    bool retorno = true;

    await auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((value) {
      banco
          .collection('usuarios')
          .doc(value.user.uid)
          .set(usuario.usuarioParaMap());
      //print("Sucesso app encontrado ${value.toString()}");
    }).catchError((errorCode) {
      print("Erro app encontrado ${errorCode.toString()}");
      retorno = false;
    });
    print("Ação realiza como ${retorno}");
    return retorno;
  }

/**
 * Verifica se há informações que seja nulas, caso exista é retornado o nome do campo
 */
  String validar(UsuarioModel usuario) {
    bool validacaoOK = false;
    String campo = "";

    if ((usuario.nome.isNotEmpty && usuario.nome.length > 3) &&
        (usuario.senha.isNotEmpty && usuario.senha.length > 6) &&
        (usuario.email.isNotEmpty && usuario.email.contains("@"))) {
      validacaoOK = true;
    } else {
      validacaoOK = false;
    }
    if (validacaoOK == false) {
      if (usuario.nome.isEmpty || usuario.nome.length < 3) {
        return campo = "*Informe seu nome acima de 3 caracteres";
      }
      if (usuario.email.isEmpty || !usuario.email.contains("@")) {
        return campo = "*Informe seu e-mail valido";
      }
      if (usuario.senha.isEmpty || usuario.senha.length < 6) {
        return campo = "*Informe sua senha acima de 6 digitos";
      }
    } else {
      return campo = "sucesso";
    }
  }

  String validarLogin(UsuarioModel usuario) {
    bool validacaoOK = false;
    FirebaseAuth auth = FirebaseAuth.instance;
    String campo = "";

    if ((usuario.senha.isNotEmpty && usuario.senha.length > 6) &&
        (usuario.email.isNotEmpty && usuario.email.contains("@"))) {
      validacaoOK = true;
    } else {
      validacaoOK = false;
    }
    if (validacaoOK == false) {
      if (usuario.email.isEmpty || !usuario.email.contains("@")) {
        return campo = "*Informe seu e-mail valido";
      }
      if (usuario.senha.isEmpty || usuario.senha.length < 6) {
        return campo = "*Informe sua senha acima de 6 digitos";
      }
    } else {
      auth
          .signInWithEmailAndPassword(
              email: usuario.email, password: usuario.senha)
          .then((value) {
        print("dados retornados foram ${value.user}");
        String sucesso = 'sucesso';
        this._stringRetorno = sucesso;
      }).catchError((error) {
        String falha = 'Email ou senha podem estar incorretos';
        this._stringRetorno = falha;
      });
    }
    campo = _stringRetorno;
    return campo;
  }

  /**
   * Verifica se usuário atual já está logado
   */
  Future<User> isLogin() async {
    User usuarioLogado = FirebaseAuth.instance.currentUser;
    if (usuarioLogado != null) {
      return usuarioLogado;
    } else {
      return null;
    }
  }

  Future getUsuario() async {
    User usuarioLogado = await FirebaseAuth.instance.currentUser;
    UsuarioModel usuario = UsuarioModel();
    if (usuarioLogado != null) {
      usuario.email = usuarioLogado.email;
      usuario.id = usuarioLogado.uid;

      return usuario;
    } else {
      return null;
    }
  }

  bool deslogar() {
    FirebaseAuth auth = FirebaseAuth.instance;
    var deslogou = (auth.signOut() ?? null);
    return (deslogou != null) ? true : false;
  }

  atualizarDados(UsuarioModel usuario) {}
}
