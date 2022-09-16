import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Finances App'),
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
          UserTransactions(),
        ],
      ),
    );
  }
}
