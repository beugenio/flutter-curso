import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main(){
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': "Qual é a sua cor favorita?",
        'respostas': [
          {'texto':'Black','pontuacao': 10},
          {'texto':'White','pontuacao': 5},
          {'texto':'Red','pontuacao': 3},
          {'texto':'Green','pontuacao': 1},
          
          ],

      },
      {
        'texto': "Qual é o seu animal favorito?",
        'respostas': [
          {'texto': 'Lion','pontuacao': 10},
          {'texto': 'Cat','pontuacao': 5},
          {'texto': 'Dog','pontuacao': 3},
          {'texto': 'Parrot','pontuacao': 1},
          ],
      },
      {
        'texto': "Qual o instrutor favorito?",
        'respostas': [
          {'texto': 'Bruno','pontuacao': 10},
          {'texto': 'Maria','pontuacao': 5},
          {'texto': 'Joao','pontuacao': 3},
          {'texto': 'Lucas','pontuacao': 1}, 
          ],
      },  
    ];
  
  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;   
    });

  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){

    //for (var textoResposta in respostasLista){
    //  widgets.add(Respostas(textoResposta,_responder));
    //}

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),//appBar
        body: temPerguntaSelecionada 
        ?  Questionario(perguntaSelecionada: _perguntaSelecionada,
                        perguntas: _perguntas, 
                        quandoResponder: _responder,
                        )
        :  Resultado(_pontuacaoTotal, _reiniciarQuestionario),//column
      ),//scaffold
    );//materialApp
  }//build

}

class PerguntaApp extends StatefulWidget{
  
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
  
}