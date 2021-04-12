import 'package:app_clone_whatsapp/model/model_contato.dart';
import 'package:flutter/material.dart';

class ContatoPage extends StatefulWidget {
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  List<ContatoModel> _contatos = [];
  int _quantidadeMaximaItens = 10;
  void _carregarLista() {
    _contatos = [];

    _contatos = [
      ContatoModel("Daine Bezerra", "(14)-9999 0000",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=da9b8e6d-cc5d-463b-83ec-a6249bf7bf56"),
      ContatoModel("Nikolly Bezerra", "(14)-9999 0001",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=92f0d99b-e517-46a2-820b-025dd2167570"),
      ContatoModel("Gabrielly Bezerra", "(14)-9999 0002",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=ece6be35-76a6-4cea-b73e-da6180656c23"),
      ContatoModel("Mãe", "(14)-9999 0003",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=c5ca7879-cf61-4957-83d2-88a6532481ef"),
      ContatoModel("Cliente", "(14)-9999 4444",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=46963d1a-7a27-460a-99af-2cb0860eb723"),
      ContatoModel("São Pedro", "(14)-9999 5555",
          "https://firebasestorage.googleapis.com/v0/b/clone-whatsapp-f5403.appspot.com/o/perfil%2Fcliente.png?alt=media&token=c7f763b5-1fae-44e3-b128-fab915a8c79f"),
    ];
    _contatos.sort((a, b) => a.nome.length.compareTo(a.nome.length));
  }

  @override
  Widget build(BuildContext context) {
    _carregarLista();
    return Container(
      //padding: EdgeInsets.all(32),
      child: ListView.builder(
          itemCount: _contatos.length,
          itemBuilder: (context, indice) {
            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 32,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(_contatos[indice].foto),
              ),
              title: Text(
                _contatos[indice].nome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                _contatos[indice].telefone,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            );
          }),
    );
  }
}
