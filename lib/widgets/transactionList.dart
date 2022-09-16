import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map(
            (tx) => Card(
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\$${tx.amount.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(tx.date),
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
