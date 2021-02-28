import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var msgJogador = "";
  var imagagemMaquina = "image/padrao.png";
  var imagagemJogador = "image/padrao.png";
  var _escolha_maquina = ['pedra', 'papel', 'tesoura'];

  // ignore: slash_for_doc_comments
  /**
   * Retorna um valor em texto que indica se usuário ganhou, pedeu ou empatou.
   * Condição de ganho [pedra -> papel / tesoura -> pedra / papel -> pedra].
   * Condição de perca [papel -> pedra / pedra -> tesoura / pedra -> papel].
   * Condição de empate [pedra-> pedra / tesoura->tesoura / papel -> papel].
   * @param bool pe = pedra.
   * @param bool pa = papel.
   * @param bool te = tesoura.
   * @return String resultado => [Ganhou :), Perdeu :(, Empatou :|]
   */
  String resultado(bool pe, bool pa, bool te) {
    //Define a escolha pela quantidade de número de array.
    var _escolha = Random().nextInt(_escolha_maquina.length);
    var _maquinaEscolha = _escolha_maquina[_escolha].toString();
    var retorno = "";
    switch (_maquinaEscolha) {
      case "pedra":
        imagagemMaquina = "image/pedra.png";
        if (pe == true) {
          retorno = "Empatou :|";
        } else if (pa == true) {
          retorno = "Ganhou :)";
        } else if (te == true) {
          retorno = "Perdeu :(";
        }
        break;
      case "papel":
        imagagemMaquina = "image/papel.png";
        if (pe == true) {
          retorno = "Perdeu :(";
        } else if (pa == true) {
          retorno = "Empatou :|";
        } else if (te == true) {
          retorno = "Ganhou :)";
        }
        break;
      case "tesoura":
        imagagemMaquina = "image/tesoura.png";
        if (pe == true) {
          retorno = "Ganhou :)";
        } else if (pa == true) {
          retorno = "Perdeu :(";
        } else if (te == true) {
          retorno = "Empatou :|";
        }
        break;
      default:
        break;
    }

    switch (retorno) {
      case "Ganhou :)":
        imagagemJogador = "image/ganhou.jpg";
        break;
      case "Perdeu :(":
        imagagemJogador = "image/perdeu.jpg";
        break;
      case "Empatou :|":
        imagagemJogador = "image/empatou.jpg";
        break;
      default:
    }
    return retorno;
  }

  /**
  * Método que constroi a aplicação e todo seu layout
  */
  @override
  Widget build(BuildContext context) {
    //-> Retorna um esqueleto do projeto.
    return Scaffold(
      //->Define um appBar
      appBar: AppBar(
        title: Text("JokeyPo"),
      ),
      //Define o corpo do projeto em uma coluna
      body: Column(
        //Centraliza o projeto no centro da tela
        crossAxisAlignment: CrossAxisAlignment.center,
        //Define um Array de Widget
        children: <Widget>[
          //1-> Texto
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              //Centraliza  o texto
              textAlign: TextAlign.center,
              //Define o style do texto
              style: TextStyle(
                //Define o tamanho do texto
                fontSize: 20,
                //Define a fontWeight
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Cola a imagem da máquina
          Image.asset(imagagemMaquina),
          //Define o texto que fica em baixo da escolha da máquina
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma  opção abaixo",
              //Centraliza  o texto
              textAlign: TextAlign.center,
              //Define o style do texto
              style: TextStyle(
                //Define o tamanho do texto
                fontSize: 20,
                //Define a fontWeight
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Define as imagem do jogador
          Row(
            //Centraliza as imagens
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Captura toque na imagem papel do jogador
              GestureDetector(
                onTap: () {
                  //Ao clicado realiza o recarregamento da tela, e roda o método;
                  setState(() {
                    msgJogador = resultado(false, true, false);
                  });
                },
                //Define a imagem papel
                child: Image.asset(
                  'image/papel.png',
                  height: 100,
                ),
              ),
              //Captura toque na imagem pedra do jogador
              GestureDetector(
                onTap: () {
                  //Ao clicado realiza o recarregamento da tela, e roda o método;
                  setState(() {
                    msgJogador = resultado(true, false, false);
                  });
                },
                //Define a imagem pedra
                child: Image.asset(
                  'image/pedra.png',
                  height: 100,
                ),
              ),
              //Captura toque na tesoura papel do jogador
              GestureDetector(
                onTap: () {
                  //Ao clicado realiza o recarregamento da tela, e roda o método;
                  setState(() {
                    msgJogador = resultado(false, false, true);
                  });
                },
                //Define a imagem tesoura
                child: Image.asset(
                  'image/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          ),
          //Define imagem para representar tipo de resposta
          Image.asset(imagagemJogador),
          //Define mensagem do jogador
          Text(msgJogador),
        ],
      ),
    );
  }
}
