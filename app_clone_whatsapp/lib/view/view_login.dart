import 'package:app_clone_whatsapp/controller/controller_gerador_rotas.dart';
import 'package:app_clone_whatsapp/controller/controller_usuario.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';
import 'package:app_clone_whatsapp/view/view_cadastro.dart';
import 'package:app_clone_whatsapp/view/view_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  ControllerUsuario controllerUsuario = ControllerUsuario();
  UsuarioModel usuario = UsuarioModel();
  String msgErro = "";

  _logar() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    usuario.email = email;
    usuario.senha = senha;
    _barraProgress(true);
    setState(() {
      msgErro = controllerUsuario.validarLogin(usuario);
    });
    if (msgErro == 'sucesso') {
      _barraProgress(false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      _barraProgress(false);
      msgErro = '';
    }
  }

  _barraProgress(bool estaCarregando) {
    Widget loadingIndicator = estaCarregando
        ? new Container(
            color: Colors.grey[300],
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          )
        : new Container();
  }

  _abrirHome() {
    //pushReplacement irá mudar a pagina.
    Navigator.pushReplacementNamed(context, GeradorRotas.ROTA_HOME);
  }

  _deslogar() {
    controllerUsuario.deslogar();
  }

  @override
  void initState() {
    super.initState();
    //verifica se o usurio est logado.
    var usuarioLogado = controllerUsuario.isLogin();
    usuarioLogado
        .then((value) {
          if (value.uid != null || value.uid != "") {
            _abrirHome();
          }
        })
        .onError((error, stackTrace) => null)
        .catchError((onError) {
          print("Erro: " + onError.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //Muda a cor de fundo para verde, ficando igual a cor original do Whatsapp
      decoration: BoxDecoration(color: Color(0xff075E54)),
      padding: EdgeInsets.all(16),
      child: Center(
        //utilizado para se ajustar, no momento da digitação, realiza um pequeno scroll
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //Ocupar todo o conteúdo do container
            children: <Widget>[
              //Paddin logo
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  'assets/imagens/logo.png',
                  width: 200,
                  height: 150,
                ),
              ),
              //Caixa de texto
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerEmail,
                  autofocus: true, //Seta o focus assim que iniciar a aplicação
                  keyboardType: TextInputType
                      .emailAddress, //Define que a caixa de texto poderá ser texto e números
                  style: TextStyle(fontSize: 20), //Define o tamanho do texto
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(
                        32, 16, 32, 16), //Define a centralização do texto
                    hintText: "E-mail", //Define o texto de apresentação
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          32), //Aredonda a caixa de texto email
                    ),
                  ),
                ),
              ),
              //Define a caixa senha
              TextField(
                controller: _controllerSenha,
                obscureText: true,
                keyboardType: TextInputType
                    .text, //Define que a caixa de texto poderá ser texto e números
                style: TextStyle(fontSize: 20), //Define o tamanho do texto
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      32, 16, 32, 16), //Define a centralização do texto
                  hintText: "Senha", //Define o texto de apresentação
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        32), //Aredonda a caixa de texto email
                  ),
                ),
              ),
              //Botão login
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                  onPressed: () => _logar(),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  //Aredonda o botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              Center(
                child: Text(
                  msgErro,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                //Utilizado para identificar touch do usuário
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta ainda? cadastre-já!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      //quando clicar, será direcionado para tela de Cadastro
                      Navigator.pushNamed(context, GeradorRotas.ROTA_CADASTRO);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
