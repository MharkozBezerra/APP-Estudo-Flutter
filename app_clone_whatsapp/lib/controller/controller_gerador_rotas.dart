import 'package:app_clone_whatsapp/view/view_cadastro.dart';
import 'package:app_clone_whatsapp/view/view_configuracao.dart';
import 'package:app_clone_whatsapp/view/view_home.dart';
import 'package:app_clone_whatsapp/view/view_login.dart';
import 'package:flutter/material.dart';

class GeradorRotas {
  static const ROTA_HOME = "/home";
  static const ROTA_LOGIN = "/login";
  static const ROTA_CADASTRO = "/cadastro";
  static const ROTA_CONFIGURACAO = "/configuracao";
  static const ROTA_RAIZ = "/";

  static Route<dynamic> gerarRotas(RouteSettings settings) {
    if (settings.name != null) {
      switch (settings.name) {
        case ROTA_RAIZ:
          return MaterialPageRoute(builder: (context) => Login());
          break;
        case ROTA_LOGIN:
          return MaterialPageRoute(builder: (context) => Login());
          break;
        case ROTA_CADASTRO:
          return MaterialPageRoute(builder: (context) => Cadastro());
          break;
        case ROTA_HOME:
          return MaterialPageRoute(builder: (context) => Home());
          break;
        case ROTA_CONFIGURACAO:
          return MaterialPageRoute(builder: (context) => Configuracao());
          break;
        default:
          _erroRota();
      }
    } else {
      return null;
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada, retorne para  última opçao!"),
        ),
      );
    });
  }
}
