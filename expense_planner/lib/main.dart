import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 69.99,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2', 
      title: 'Weekly Groceries', 
      amount: 35.76,
      date: DateTime.now()
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Text('Chart'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: transactions.map((tx) {
              return Card(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(tx.amount.toString())
                    ),
                    Column(
                      children: <Widget>[
                        Text(tx.title),
                        Text(tx.date.toString())
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
