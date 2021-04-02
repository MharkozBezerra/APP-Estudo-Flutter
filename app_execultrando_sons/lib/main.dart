import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool primeiraVez = true;
  double _volume = 0.5;
  /**
   * Inicia o som
   */
  _execultar() async {
    //   String url =
    //       "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    //   int resultado = await audioPlayer.play(url);
    //   if (resultado == 1) {}
    if (primeiraVez == true) {
      audioPlayer = await audioCache.play('bach.mp3');
      primeiraVez = false;
    } else {
      audioPlayer.resume();
    }
    audioPlayer.setVolume(_volume);
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if (resultado == 1) {
      primeiraVez = true;
    }
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
    if (resultado == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Execultando Sons"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          //Slider- Volume
          Slider(
              value: _volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novoVolume) {
                setState(() {
                  _volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //1
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset('assets/image/executar.png'),
                  onTap: () {
                    _execultar();
                  },
                ),
              ),
              //2
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset('assets/image/pausar.png'),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              //3
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset('assets/image/parar.png'),
                  onTap: () {
                    _parar();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
