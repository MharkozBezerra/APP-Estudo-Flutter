import 'package:app_clone_youtube/model/video_model.dart';
import 'package:flutter/material.dart';
import 'package:app_clone_youtube/api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    Future<List<Video>> videos;
    Api api = new Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              //lista uma lista de progress
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, indice) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[indice];
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit
                                  .cover, // ocupa todo o espaço do container
                              image: NetworkImage(video.imagem),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, indice) => Divider(
                        color: Colors.red,
                        height: 3,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                //lista uma lista de progress
                child: Text("Nada encontrado no momento"),
              );
            }
            break;
        }
      },
    );
  }
}
