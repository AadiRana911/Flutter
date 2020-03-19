import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase{
    if(resultScore <= 7){
      return 'You are so innocent';
    }else if(resultScore <= 10){
      return 'You are pretty much good';
    }else if(resultScore <= 14){
      return 'You are strange';
    }else{
      return 'You belongs to a terrible personality';
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      resultPhrase, 
                      style: TextStyle(fontSize: 40)
                    ),
                    FlatButton(
                      child: Text('Restart Quiz'),
                      textColor: Colors.blue,
                      onPressed: resetQuiz,
                    )
                  ],
                ) 
              ),
    );
  }
}