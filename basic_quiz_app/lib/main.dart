import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State <MyApp>{
  var len = 0;
  var questionIndex = 0;

  void answerQuestion(){
    if(questionIndex < len){
      setState(() {
        questionIndex++;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    this.len = questions.length;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion),
            RaisedButton(child: Text('Answer 2'), onPressed: answerQuestion),
            RaisedButton(child: Text('Answer 3'), onPressed: answerQuestion),
          ],
        ),
      ),
    );
  }
}
