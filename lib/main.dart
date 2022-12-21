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
  late String titleInput;
  late String amountInput;

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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: ((value) {
                      titleInput = value;
                    }),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    onChanged: (value) {
                      amountInput = value;
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: TextButton(
                          onPressed: (() {
                            print('$titleInput, $amountInput');
                          }),
                          child: const Text('Add Transaction')))
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
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${transaction.amount}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
