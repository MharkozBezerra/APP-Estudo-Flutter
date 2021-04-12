import 'package:app_clone_whatsapp/view/tabs_page/view_tabs_contato.dart';
import 'package:app_clone_whatsapp/view/tabs_page/view_tabs_conversa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_clone_whatsapp/controller/controller_usuario.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// obrigatório o uso de with SingleTickerProviderStateMixin.
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ControllerUsuario controllerUsuario = ControllerUsuario();
  UsuarioModel usuario = UsuarioModel();
  //Utilizado quando estiver um tab na aplicação
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: 0,
        length:
            2, //Deve se usar um número >= 2, ou informar a quantidade que será usado.
        vsync: this //-> with SingleTickerProviderStateMixin
        );
    Future<User> usuarioLogado = controllerUsuario.isLogin();
    usuarioLogado.then((recuperado) {
      usuario.email = (recuperado.email != null) ? recuperado.email : '';
    }).catchError((error) {
      usuario.email = "";
      controllerUsuario.deslogar();
      //Retorna para o login
      Navigator.pop(context);
    });
    //------------------------------//
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Descarta o controller
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clone WhatsApp'),
        bottom: TabBar(
          //Controlador da TabBar
          controller: _tabController,
          //tabs: Conjunto de Widget
          tabs: <Widget>[
            //Define uma tab
            Tab(
              //Define um texto
              text: "Conversas",
              //Define o ícone
              //icon: Icon(Icons.home),
            ),
            Tab(
              text: "Contatos",
              //icon: Icon(Icons.email),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ConversaPage(),
          ContatoPage(),
        ],
      ),
    );
  }
}
