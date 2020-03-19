import 'package:basic_quiz_app/quiz.dart';
import 'package:basic_quiz_app/result.dart';
import 'package:flutter/material.dart';


main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'Question Text': 'What\'s your favorite color?',
      'Answers': [{'text': 'Red', 'score': 10}, {'text': 'Black', 'score': 5}, {'text': 'Blue', 'score': 3}]
    },
    {
      'Question Text': 'What\'s your favorite animal?',
      'Answers': [{'text': 'Rabbit', 'score': 5}, {'text': 'Snake', 'score': 7}, {'text': 'Cat', 'score': 6}, {'text': 'Penguin', 'score': 2}]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions)
            : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
