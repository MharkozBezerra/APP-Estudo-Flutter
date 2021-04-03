import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool _primeiraVez = true;

  _execultarSom(numero) async {
    if (_primeiraVez == true) {
      audioPlayer = await audioCache.play(numero + ".mp3");
    } else {
      int resultado = await audioPlayer.stop();
      if (resultado == 1) {
        _primeiraVez = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, //Define a quantidade de colunas
      children: <Widget>[
        GestureDetector(
          child: Image.asset('assets/image/1.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('1');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/2.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('2');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/3.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('3');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/4.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('4');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/5.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('5');
            });
          },
        ),
        GestureDetector(
          child: Image.asset('assets/image/6.png'),
          onTap: () {
            setState(() {
              _primeiraVez = true;
              _execultarSom('6');
            });
          },
        ),
      ],
    );
  }
}
