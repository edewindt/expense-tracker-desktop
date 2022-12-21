import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(const PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', amount: 69.99, date: DateTime.now(), title: 'New Shoes'),
    Transaction(
        id: 't2', amount: 499.99, date: DateTime.now(), title: 'New Computer'),
    Transaction(
        id: 't3', amount: 188669.99, date: DateTime.now(), title: 'New House')
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Chart!'),
            ),
          ),
          Column(
            children: [
              for (Transaction transaction in transactions)
                Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(20),
                        width: 110,
                        child: Text(
                          transaction.amount.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Column(
                        children: [
                          Text(transaction.title),
                          Text(transaction.date.toString())
                        ],
                      )
                    ],
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
