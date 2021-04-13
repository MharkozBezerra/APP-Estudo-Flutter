import 'package:app_clone_whatsapp/controller/controller_usuario.dart';
import 'package:app_clone_whatsapp/model/model_usuario.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Configuracao extends StatefulWidget {
  @override
  _ConfiguracaoState createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  UsuarioModel usuarioModel = UsuarioModel();
  TextEditingController _controllerNome = TextEditingController();
  ControllerUsuario _controllerUsuario = ControllerUsuario();
  File _imagem;
  bool subindoImagem = false;
  String fotoUser = "";

  Future _recuperarImagem(String destino) async {
    final picker = ImagePicker();
    var pickedFile = null;
    switch (destino) {
      case 'Camera':
        pickedFile = await picker.getImage(source: ImageSource.camera);
        break;
      case 'Galeria':
        pickedFile = await picker.getImage(source: ImageSource.gallery);
        break;
      default:
    }
    setState(() {
      subindoImagem = true;
      if (pickedFile != null) {
        _imagem = File(pickedFile.path);
        _uploadImagemUser(_imagem);
        print('link retornado ' + fotoUser);
      } else {
        print('Não há image selecionada.');
      }
    });
  }

  _uploadImagemUser(File arquivo) async {
    if (arquivo != null) {
      fotoUser =
          await _controllerUsuario.uploadImagemUsuario(arquivo, usuarioModel);
    }
    setState(() {
      subindoImagem = false;
    });
  }

  _recuperarUsuario() async {
    await _controllerUsuario.getUsuario().then((usuario) {
      usuarioModel.id = usuario.id;
      usuarioModel.nome = usuario.nome;
      _controllerNome.text = usuario.nome;

      if (usuario.foto != null && usuario.foto != "") {
        print('link da foto: ' + usuario.foto);
        usuarioModel.foto = usuario.foto;
      } else {
        usuarioModel.foto = '';
      }
    }).catchError((usuarioErro) {
      print('Erro ao recuperar usuário: ' + usuarioErro.toString());
    }).onError((error, stackTrace) => null);

    setState(() {
      fotoUser = usuarioModel.foto;
      subindoImagem = false;
    });
  }

  _barraProgress(bool estaCarregando) {
    return estaCarregando
        ? Container(
            color: Colors.white,
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          )
        : Container();
    // return estaCarregando ? CircularProgressIndicator() : Container();
  }

  _alterarNomeFoto() async {
    usuarioModel.nome = _controllerNome.text;
    return await _controllerUsuario.atualizarFotoNomeUsuario(
        fotoUser, usuarioModel);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      subindoImagem = true;
    });
    fotoUser =
        'https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fsem-foto.png?alt=media&token=38b75c49-fdc5-42ca-b165-ad666036f807';
    _recuperarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuraçoes"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _barraProgress(subindoImagem),
                CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        //Verifica se há foto,
                        (fotoUser != null) ? NetworkImage(fotoUser) : ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        _recuperarImagem("Galeria");
                      },
                      child: Text('Galeria'),
                    ),
                    FlatButton(
                      onPressed: () {
                        _recuperarImagem("Camera");
                      },
                      child: Text(
                        'Camera',
                      ),
                    ),
                  ],
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
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      _alterarNomeFoto();
                      _recuperarUsuario();
                    },
                    child: Text(
                      "Salvar",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
