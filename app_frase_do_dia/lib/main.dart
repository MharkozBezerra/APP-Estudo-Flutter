//import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math'; //Operações matemática.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStateFul(),
    ),
  );
}

class HomeStateFul extends StatefulWidget {
  @override
  _HomeStateFulState createState() => _HomeStateFulState();
}

class _HomeStateFulState extends State<HomeStateFul> {
  var _fraseGerada = "Clique Abaixo para gerar uma nova frase";

  String __gerarFrase() {
    //Frage gerada
    var _frase = [
      "1 – “O sucesso nasce do querer, da determinação e persistência em se chegar a um objetivo. Mesmo não atingindo o alvo, quem busca e vence obstáculos, no mínimo fará coisas admiráveis” – José de Alencar",
      "2 – “Se você quer ser bem-sucedido precisa de dedicação total, buscar seu último limite e dar o melhor de si mesmo” – Ayrton Senna",
      "3 – “Não crie limites para si mesmo. Você deve ir tão longe quanto sua mente permitir. O que você mais quer pode ser conquistado” – Mary Kay Ash",
      "4 – “Nenhum obstáculo será grande se a sua vontade de vencer for maior” – Autor desconhecido",
      "5 – “Dificuldades preparam pessoas comuns para destinos extraordinários” C.S Lewis",
      "6 – “Nenhum homem será um grande líder se quiser fazer tudo sozinho ou se quiser levar todo o crédito por fazer isso” – Andrew Carnegie",
      "7 – “Bom mesmo é ir à luta com determinação, abraçar a vida com paixão, perder com classe e vencer com ousadia, porque o mundo pertence a quem se atreve e a vida é muito curta, para ser insignificante” — Charlie Chaplin",
      "8 – “Pessoas vencedoras não são aquelas que não falham, são aquelas que não desistem”  – Autor desconhecido",
      "9 – “Só existem dois dias do ano em que você não pode fazer nada: um se chama ontem e outro amanhã” – Dalai Lama",
      "10 – “A vida é um constante recomeço. Não se dê por derrotado e siga adiante. As pedras que hoje atrapalham sua caminhada amanhã enfeitarão a sua estrada”  – Autor desconhecido",
      "11 – “Ouse ir além, ouse fazer diferente e o poder lhe será dado!” – José Roberto Marques",
      "12 – “Ouse, arrisque, não desista jamais e saiba valorizar quem te ama, esses sim merecem seu respeito. Quanto ao resto, bom, ninguém nunca precisou de restos para ser feliz” – Clarice Lispector",
      "13 – “Para ser um campeão você tem que acreditar em si mesmo quando ninguém mais acredita” – Muhammad Ali",
      "14 – “No fim tudo dá certo, e se não deu certo é porque ainda não chegou ao fim” – Fernando Sabino",
      "15 – “Você nunca sabe que resultados virão da sua ação. Mas se você não fizer nada, não existirão resultados” – Mahatma Gandhi",
    ];

    //Gera uma mensagem randonica pelo tamanho da _frase
    var numSoteado = Random().nextInt(_frase.length);
    //Retorna frase gerada
    return _frase[numSoteado].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          //define 100% do espaço disposinvél
          width: double.infinity,
          child: Column(
            //Centralisa o container
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _fraseGerada = __gerarFrase();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
