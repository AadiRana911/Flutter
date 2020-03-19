import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';


class Quiz extends StatelessWidget {
  final List <Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({this.questions, this.answerQuestion, this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Question(questions[questionIndex]['Question Text']),
                  ...(questions[questionIndex]['Answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => answerQuestion(answer['score']), answer['text']);
                  }).toList()
                ],
              );
  }
}