import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget{
    final int perguntaSelecionada;
    final List <Map<String, Object>> perguntas;
    final void Function(int) quandoResponder;

    Questionario({
      @required this.perguntaSelecionada, 
      @required this.perguntas, 
      @required this.quandoResponder,
    });

    bool get temPerguntaSelecionada{
      return perguntaSelecionada < perguntas.length;
    }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostasLista = temPerguntaSelecionada 
    ? perguntas[perguntaSelecionada]['respostas']
    : null;

    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto']),
            ...respostasLista.map((resp) {
              return Respostas(                            // no lugar da =>      
                resp['texto'],                             // passar funcao como parametro       
                () => quandoResponder(resp['pontuacao']), // poderia ser uma função {} 
                ); 
            }).toList()
          ],//children
        );
  }





}