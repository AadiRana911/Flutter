import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {  
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                  ),
                  FlatButton(
                    textColor: Colors.purple, 
                    child: Text('Add Transaction'),
                    onPressed: () => addTx(titleController.text, double.parse(amountController.text))
                    
                  )
                ],
              ),
            ),
          );
  }
}