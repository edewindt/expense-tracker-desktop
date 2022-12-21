import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

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
          Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Title')),
                  TextField(decoration: InputDecoration(labelText: 'Amount')),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      child: TextButton(
                          onPressed: (() {}), child: Text('Add Transaction')))
                ],
              ),
            ),
          ),
          Column(
            children: [
              for (Transaction transaction in transactions)
                Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transaction.amount}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              DateFormat().add_MMMEd().format(transaction.date))
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
