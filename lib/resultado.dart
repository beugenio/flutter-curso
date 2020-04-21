import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  final int pontuacao;
  final void Function() quandoReinicarQuestionario;

  Resultado(this.pontuacao, this.quandoReinicarQuestionario);

  String get fraseResultado{
    if(pontuacao < 8){
      return 'parabéns!';
    }else if(pontuacao < 12){
      return 'Muito bom!';
    }else if (pontuacao < 16){
      return 'impressionante';
    }else{
      return 'Zerou o score!';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
          fraseResultado, 
          style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(onPressed: quandoReinicarQuestionario, 
                   child: Text('Reiniciar?', 
                                style: TextStyle(fontSize: 18),
                    ),
                   textColor: Colors.blue,)
      ],
    );
  }


  
}