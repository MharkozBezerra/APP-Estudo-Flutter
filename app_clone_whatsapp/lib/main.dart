import 'package:flutter/material.dart';
import 'package:app_clone_whatsapp/controller/controller_gerador_rotas.dart';
import 'package:app_clone_whatsapp/view/view_cadastro.dart';
import 'package:app_clone_whatsapp/view/view_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/view_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075e54),
      accentColor: Color(0xff25d366),
    ),
    initialRoute: "/",
    onGenerateRoute: GeradorRotas.gerarRotas,
    //((RouteSettings settings) {
    // switch (settings.name) {
    //   case '/':
    //   case '/login':
    //     return MaterialPageRoute(builder: (context) => Login());
    //     break;
    //   case '/cadastro':
    //     return MaterialPageRoute(builder: (context) => Cadastro());
    //     break;
    //   case '/home':
    //     return MaterialPageRoute(builder: (context) => Home());
    //     break;
    //   default:
    //     _erroRota();
    // }
    //}),
    debugShowCheckedModeBanner: false,
  ));
}

Route<dynamic> _erroRota() {
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
