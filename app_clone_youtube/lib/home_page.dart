import 'package:app_clone_youtube/pages/biblioteca_page.dart';
import 'package:app_clone_youtube/pages/em_alta_page.dart';
import 'package:app_clone_youtube/pages/inicio_page.dart';
import 'package:app_clone_youtube/pages/inscritos_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _telaAtual = 0;
  List<Widget> telas = [Inicio(), EmAlta(), Inscritos(), Biblioteca()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey,
            opacity: 1,
          ),
          title: Image.asset(
            'imagens/youtube.png',
            width: 98,
            height: 22,
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.videocam), onPressed: null),
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(icon: Icon(Icons.account_circle), onPressed: null),
          ]),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_telaAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _telaAtual,
        onTap: (indice) {
          setState(() {
            _telaAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              title: Text("Home"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              title: Text("Em Alta"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
