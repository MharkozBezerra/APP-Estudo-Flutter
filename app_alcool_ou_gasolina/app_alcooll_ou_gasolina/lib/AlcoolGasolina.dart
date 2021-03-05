import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  //Controlador de texto
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  //String de retorno do resultado
  String _retorno = "";
  // função que faz o calculo
  void _calcular() {
    //resgata os valores e tenta transformar números double
    double _alcool = double.tryParse(_controllerAlcool.text);
    double _gasolina = double.tryParse(_controllerGasolina.text);
    // função "setState((){});" usado para atualizar a tela.
    setState(() {
      //Realiza a operação, verificando se os campos estão válidos
      if (_alcool != null && _gasolina != null) {
        //Realiza a operação, para saber se álcool está mais cara que a gasolina.
        if (_alcool > _gasolina) {
          //Retorna resultado
          _retorno = "Compensa a Gasolina";
          //Realiza a operação, para saber se gasolina está mais cara que o álcool.
        } else if (_alcool < _gasolina) {
          //Retorna resultado
          _retorno = "Compensa a Álcool";
        }
        //Caso seja iguais, retorna outra mensagem
        else {
          _retorno = "Ai tanto faz ;)";
        }
      }
      //Retorna mensagem dizendo que não foi possível realizar a conversão entre as caixas.
      else {
        //Retorna resultado.
        _retorno = "Algo deu errado\n verifique as  informações";
      }
    });
  }

  //Função construtora
  @override
  Widget build(BuildContext context) {
    //Retono da função, sendo um Scaffold.
    return Scaffold(
      //Cria a appbar
      appBar: AppBar(
        //Seta um titúlo
        title: Text('Álcool ou Gasolina?'),
        //Seta a cor da appbar
        backgroundColor: Colors.black,
      ),
      //Corpo do app setando um Container
      body: Container(
        //Seta uma ScrollView (rolagem para baixo/cima), para ampliar o tamanho do app.
        child: SingleChildScrollView(
          //Define um espaçamento para top.left, rigth, bottom de 32px
          padding: EdgeInsets.all(32),
          //Define uma coluna para a ScrollView
          child: Column(
            //Define que todos os compomentes devem ocupar o máximo da tela do app.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Define a lista de Widget's que será usada.
            children: <Widget>[
              //Aplica-se um espaçamento.
              Padding(
                //Define um espaçamento para  bottom de 32px
                padding: EdgeInsets.only(bottom: 32),
                //Define que nesse espaço ficará uma imagem
                child: Image.asset('images/logo.png'),
              ),
              //Aplica-se um outro espaçamento.
              Padding(
                //Define um espaçamento somente para  bottom de 32px
                padding: EdgeInsets.only(bottom: 10),
                //Define um texto que será mostrado na tela
                child: Text(
                  'Saiba qual é a melhor opção para seu abastecimento!',
                  //Aplica-se um estilo ao texto.
                  style: TextStyle(
                    //Tamanho da fonte
                    fontSize: 25,
                    //Espessura da fonte.
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Aplica-se uma caixa de texto
              TextField(
                //Define o tipo do teclado, nesse caso númerico.
                keyboardType: TextInputType.number,
                //Define um stylo para a  caixa de texto.
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 1.59",
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    return _calcular();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _retorno,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
