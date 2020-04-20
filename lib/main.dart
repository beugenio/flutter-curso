import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

main(){
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  final _perguntas = const [
      {
        'texto': "Qual é a sua cor favorita?",
        'respostas': ['Black','White','Red','Green'],

      },
      {
        'texto': "Qual é o seu animal favorito?",
        'respostas': ['Lion','Cat','Dog','Parrot'],
      },
      {
        'texto': "Qual o instrutor favorito?",
        'respostas': ['Bruno','Maria','Joao','Lucas'],
      },  
    ];
  
  void _responder(){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
    
    
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){


    List<String> respostasLista = temPerguntaSelecionada 
    ? _perguntas[_perguntaSelecionada]['respostas']
    : null;

    //for (var textoResposta in respostasLista){
    //  widgets.add(Respostas(textoResposta,_responder));
    //}

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),//appBar
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto']),
            ...respostasLista.map((t) => Respostas(t, _responder)).toList()
          ],//children
        ) : Center(
              child: Text('Parabéns!!', style: TextStyle(fontSize: 28),
            ),
        ) ,//column
      ),//scaffold
    );//materialApp
  }//build

}

class PerguntaApp extends StatefulWidget{
  
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
  
}