import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  String titleForm;

  String amountForm;

  void submitData() {
    final enteredTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enterdAmount <= 0){
      print('input not valid');
      return;
    }
    widget.addTx(enteredTitle, enterdAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              cursorColor: Colors.green,
              onChanged: (e) => { titleForm = e},
              onSubmitted: (_) => submitData,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountController,
              cursorColor: Colors.green,
              onChanged: (e) => { amountForm = e},
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  elevation: 10,
                  child: Text('Add new Transaction'),
                  onPressed: submitData,
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
