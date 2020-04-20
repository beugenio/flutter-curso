import 'package:flutter/material.dart';

class Respostas extends StatelessWidget{
  final String pergunta;
  final void Function() onSelecionado;

  Respostas(this.pergunta, this.onSelecionado);
  
  @override
  Widget build(BuildContext context){
   
      return Container(
        width: double.infinity,
        child: RaisedButton(
          child: Text(pergunta),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: onSelecionado,
        ),
      );
   
  }

}