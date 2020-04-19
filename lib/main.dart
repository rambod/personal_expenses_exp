import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/user_transaction.dart';

import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

//  void startAddNewTransacrion(BuildContext ctx){
//    showModalBottomSheet(context: ctx, builder: (bCtx){
//      return NewTransaction()
//    });
//
//  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Personal Expense'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 80,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'RamAi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.red,
                              offset: Offset(3, 3),
                              blurRadius: 15)
                        ]),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(120),
                    )),
              ),
              Card(
                elevation: 5,
                child: Container(width: double.infinity, child: Text('CHART!')),
              ),
              UserTransaction(),
            ],
          ),
        ),
// This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
