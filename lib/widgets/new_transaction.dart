import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  String _titleForm;

  String _amountForm;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enterdAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enterdAmount <= 0 || _selectedDate == null) {
      print('input not valid');
      return;
    }
    widget.addTx(enteredTitle, enterdAmount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((value){
      if (value == null){
        return;
      }
      setState(() {
        _selectedDate = value;

      });
    });
    
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
              controller: _titleController,
              cursorColor: Colors.green,
              onChanged: (e) => {_titleForm = e},
              onSubmitted: (_) => _submitData,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _amountController,
              cursorColor: Colors.green,
              onChanged: (e) => {_amountForm = e},
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            Row(
              children: [
                Text(_selectedDate == null ? 'No Date Chosen!' :DateFormat.yMd().format(_selectedDate) ),
                FlatButton(
                  child: Text('Chose Date',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  elevation: 10,
                  child: Text('Add new Transaction'),
                  onPressed: _submitData,
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
