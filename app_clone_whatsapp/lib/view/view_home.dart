import 'package:app_clone_whatsapp/controller/controller_gerador_rotas.dart';
import 'package:app_clone_whatsapp/view/tabs_page/view_tabs_contato.dart';
import 'package:app_clone_whatsapp/view/tabs_page/view_tabs_conversa.dart';
import 'package:app_clone_whatsapp/view/view_login.dart';
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
  List<String> itensMenu = ["Configurações", "Deslogar"];
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

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        Navigator.pushNamed(context, GeradorRotas.ROTA_CONFIGURACAO);
        break;
      case "Deslogar":
        controllerUsuario.deslogar();
        Navigator.pushReplacementNamed(context, GeradorRotas.ROTA_LOGIN);
        break;
      default:
    }
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
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList();
            },
          ),
        ],
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
