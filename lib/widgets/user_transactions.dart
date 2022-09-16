import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'new_transactions.dart';
import 'transactionList.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
