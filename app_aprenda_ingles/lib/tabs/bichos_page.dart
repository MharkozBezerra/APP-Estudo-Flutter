import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Bichos extends StatefulWidget {
  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool _primeiraVez = true;

  _execultarSom(nomeBicho) async {
    if (_primeiraVez == true) {
      audioPlayer = await audioCache.play(nomeBicho + ".mp3");
    } else {
      int resultado = await audioPlayer.stop();
      if (resultado == 1) {
        _primeiraVez = true;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioCache.loadAll([
      'cao.mp3',
      'gato.mp3',
      'leao.mp3',
      'macaco.mp3',
      'ovelha.mp3',
      'vaca.mp3'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaLargura = MediaQuery.of(context).size.aspectRatio;
    return GridView.count(
      crossAxisCount: 2, //Define a quantidade de colunas
      childAspectRatio:
          alturaLargura * 2, //Define a altura e multiplica pela altura
      children: <Widget>[
        GestureDetector(
          child: Image.asset('assets/image/cao.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('cao');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/gato.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('gato');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/leao.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('leao');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/macaco.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('macaco');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/ovelha.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('ovelha');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/vaca.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('vaca');
            });
          },
        ),
      ],
    );
  }
}
