import 'package:flutter/material.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';
import 'package:app_clone_whatsapp/controller/controller_usuario.dart';

import 'view_home.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>
    with SingleTickerProviderStateMixin {
  //Controladores de texto
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String msgErro = "";
  ControllerUsuario controllerUsuario = ControllerUsuario();
  UsuarioModel usuario = UsuarioModel();

  cadastrar() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    usuario.nome = nome;
    usuario.email = email;
    usuario.senha = senha;
    _barraProgress(true);
    setState(() {
      msgErro = controllerUsuario.validar(usuario);
      if (msgErro == 'sucesso') {
        Future<bool> cadastroOK = controllerUsuario.cadastrarUsuario(usuario);
        (cadastroOK.then((value) {
          _barraProgress(false);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
          msgErro = '';
        }).catchError((onError) {
          msgErro = "Erro: " + onError.toString();
        }));
        _barraProgress(false);
        msgErro = '';
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadasto"),
      ),
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
                    'assets/imagens/usuario.png',
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus:
                        true, //Seta o focus assim que iniciar a aplicação
                    controller: _controllerNome,
                    keyboardType: TextInputType
                        .text, //Define que a caixa de texto poderá ser texto e números
                    style: TextStyle(fontSize: 20), //Define o tamanho do texto
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(
                          32, 16, 32, 16), //Define a centralização do texto
                      hintText: "Nome", //Define o texto de apresentação
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            32), //Aredonda a caixa de texto email
                      ),
                    ),
                  ),
                ),
                //Caixa de texto
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
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
                  obscureText:
                      true, //informa que irá esconder os digitos da senha
                  obscuringCharacter: "*", //seta o que será usado
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
                    onPressed: () => cadastrar(),
                    child: Text(
                      "Cadastrar",
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
                //Será mostrado a mensagem de erro aqui
                Center(
                  child: Text(
                    msgErro,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
