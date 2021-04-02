import 'package:app_flutter_tabs_bar/pages_tabs/primeira_pagina.dart';
import 'package:app_flutter_tabs_bar/pages_tabs/segunda_pagina.dart';
import 'package:app_flutter_tabs_bar/pages_tabs/terceira_pagina.dart';
import 'package:flutter/material.dart';
import '';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// obrigatório o uso de with SingleTickerProviderStateMixin.
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //Utilizado quando estiver um tab na aplicação
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
        initialIndex: 1,
        length:
            3, //Deve se usar um número >= 2, ou informar a quantidade que será usado.
        vsync: this //-> with SingleTickerProviderStateMixin
        );
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
        backgroundColor: Colors.red,
        title: Text("Abas"),
        //Define uma tabbar no app
        bottom: TabBar(
          //Controlador da TabBar
          controller: _tabController,
          //tabs: Conjunto de Widget
          tabs: <Widget>[
            //Define uma tab
            Tab(
              //Define um texto
              text: "Home",
              //Define o ícone
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      //Define o corpo das tabs
      body: TabBarView(
        //Controlador da TabBar
        controller: _tabController,
        children: <Widget>[PrimeiraPagina(), SegundaPagina(), TerceiraPagina()],
      ),
    );
  }
}
