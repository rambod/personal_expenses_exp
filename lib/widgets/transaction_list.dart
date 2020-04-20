import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._transaction,this._transactionDelete);

  final List<Transaction> _transaction;
  final Function _transactionDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _transaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  'No Transaction Added Yet!',
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/sleep.png',
                  fit: BoxFit.cover,
                  height: 100,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: FittedBox(
                        child: Text('\$' +
                            _transaction[index].amount.toStringAsFixed(2)),
                      ),
                    ),
                    title: Text(
                      _transaction[index].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat().format(_transaction[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete),color: Theme.of(context).errorColor,onPressed: ()=>_transactionDelete(_transaction[index].id),),
                  ),
                ));

//          return Card(
//            elevation: 5,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  child: Text(
//                    '\$' + _transaction[index].amount.toStringAsFixed(2),
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 14,
//                        color: Theme.of(context).primaryColor,
//                        shadows: [
//                          Shadow(
//                              offset: Offset(.5,.5),
//                              blurRadius: 1)
//                        ]),
//                  ),
//                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                  decoration: BoxDecoration(
//                      border: Border.all(color: Theme.of(context).accentColor, width: 3)),
//                  padding: EdgeInsets.all(10),
//                  width: 100,
//                  alignment: Alignment.center,
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    Text(
//                      _transaction[index].title,
//                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Icon(
//                          Icons.date_range,
//                          color: Colors.grey,
//                        ),
//                        Text(
//                          DateFormat().format(_transaction[index].date),
//                          style: TextStyle(color: Colors.grey),
//                        ),
//                      ],
//                    ),
//                  ],
//                )
//              ],
//            ),
//          );
              },
              itemCount: _transaction.length,
//        children: _transaction.map((tx) {
//          return
//        }).toList(),
            ),
    );
  }
}
