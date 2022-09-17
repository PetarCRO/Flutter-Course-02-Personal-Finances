import 'package:flutter/material.dart';
import 'package:personal_finances/widgets/new_transactions.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transactionList.dart';

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

class PersonalFinances extends StatefulWidget {
  @override
  State<PersonalFinances> createState() => _PersonalFinancesState();
}

class _PersonalFinancesState extends State<PersonalFinances> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'shoes', amount: 72.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'shoes', amount: 23.18, date: DateTime.now()),
    Transaction(id: 't4', title: 'shoes', amount: 21.98, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Finances App'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: const Text('CHART!'),
              width: double.infinity,
              color: Colors.blue,
            ),
            elevation: 5,
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
