import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_clone_whatsapp/controller/controller_usuario.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControllerUsuario controllerUsuario = ControllerUsuario();
  UsuarioModel usuario = UsuarioModel();

  @override
  void initState() {
    super.initState();
    Future<User> usuarioLogado = controllerUsuario.isLogin();
    usuarioLogado.then((recuperado) {
      usuario.email = (recuperado.email != null) ? recuperado.email : '';
    }).catchError((error) {
      usuario.email = "";
      //Retorna para o login
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clone WhatsApp'),
      ),
      body: Container(
        child: Center(
          child: Text(usuario.email),
        ),
      ),
    );
  }
}
