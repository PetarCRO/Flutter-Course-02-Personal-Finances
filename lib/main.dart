import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Finances',
      home: PersonalFinances(),
    );
  }
}

class PersonalFinances extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'shoes', amount: 72.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'shoes', amount: 23.18, date: DateTime.now()),
    Transaction(id: 't4', title: 'shoes', amount: 21.98, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Finances App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: Container(
              child: Text('CHART!'),
              width: double.infinity,
              color: Colors.blue,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions
                .map((tx) => Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 22),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              tx.amount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                tx.date.toString(),
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
