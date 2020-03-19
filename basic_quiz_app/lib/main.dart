import 'package:flutter/material.dart';

import './Question.dart';
import './answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State <MyApp>{
  var _questionIndex = 0;

  void _answerQuestion(){
    setState(() {
      _questionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'Question Text': 'What\'s your favorite color?',
        'Answers': ['Red', 'Black', 'Blue']
      },
      {
        'Question Text': 'What\'s your favorite animal?',
        'Answers': ['Rabbit', 'Snake', 'Cat', 'Penguin']
      }
      ,
      
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['Question Text']),
            ...(questions[_questionIndex]['Answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
