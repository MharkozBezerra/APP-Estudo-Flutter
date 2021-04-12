import 'package:app_clone_whatsapp/model/model_conversa.dart';
import 'package:flutter/material.dart';

class ConversaPage extends StatefulWidget {
  @override
  _ConversaPageState createState() => _ConversaPageState();
}

class _ConversaPageState extends State<ConversaPage> {
  List<ConversaModel> _conversas = [];
  int _quantidadeMaximaItens = 10;
  void _carregarLista() {
    _conversas = [];

    _conversas = [
      ConversaModel("Daine Bezerra", "Olá mozão",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=da9b8e6d-cc5d-463b-83ec-a6249bf7bf56"),
      ConversaModel("Nikolly Bezerra", "Oi pai! tudo bem?",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=92f0d99b-e517-46a2-820b-025dd2167570"),
      ConversaModel("Gabrielly Bezerra", "Oi pai! posso ir junto com a nih?",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=ece6be35-76a6-4cea-b73e-da6180656c23"),
      ConversaModel("Mãe", "Vai sair hoje?",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=c5ca7879-cf61-4957-83d2-88a6532481ef"),
      ConversaModel("Cliente", "Bom dia! podemos conversar",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=46963d1a-7a27-460a-99af-2cb0860eb723"),
      ConversaModel("São Pedro", "Vai curinthias",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fcliente.png?alt=media&token=c7f763b5-1fae-44e3-b128-fab915a8c79f"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _carregarLista();
    return Container(
      //padding: EdgeInsets.all(32),
      child: ListView.builder(
          itemCount: _conversas.length,
          itemBuilder: (context, indice) {
            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 32,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(_conversas[indice].foto),
              ),
              title: Text(
                _conversas[indice].nome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                _conversas[indice].mensagem,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            );
          }),
    );
  }
}
