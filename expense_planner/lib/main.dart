import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  final List<Transaction> _userTransaction = [
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

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(
      id: DateTime.now().toString(), 
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now()
    );

    setState(() => _userTransaction.add(newTx));
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
