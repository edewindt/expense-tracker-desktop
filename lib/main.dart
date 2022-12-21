import 'package:flutter/material.dart';
import 'package:personal_exp/new_transaction.dart';
import 'package:personal_exp/transaction_list.dart';
import './transactions.dart';

void main() => runApp(const PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', amount: 69.99, date: DateTime.now(), title: 'New Shoes'),
    Transaction(
        id: 't2', amount: 499.99, date: DateTime.now(), title: 'New Computer'),
    Transaction(
        id: 't3', amount: 188669.99, date: DateTime.now(), title: 'New House')
  ];

  void addTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        title: title);
    setState(() {
      transactions.add(newTx);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => startNewTransaction(context),
              icon: Icon(Icons.add))
        ],
        title: const Text('Flutter App'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart!'),
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}
