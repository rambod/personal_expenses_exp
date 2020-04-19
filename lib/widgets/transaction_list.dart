import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._transaction);

  final List<Transaction> _transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.blue,
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$' + _transaction[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.purple,
                        shadows: [
                          Shadow(
                              color: Colors.purple,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3)
                        ]),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 3)),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  alignment: Alignment.center,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      _transaction[index].title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        Text(
                          DateFormat().format(_transaction[index].date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _transaction.length,
//        children: _transaction.map((tx) {
//          return
//        }).toList(),
      ),
    );
  }
}
