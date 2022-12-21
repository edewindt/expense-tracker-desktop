import 'package:flutter/material.dart';
import 'package:personal_exp/new_transaction.dart';
import 'package:personal_exp/transaction_list.dart';
import './transactions.dart';
import './chart.dart';

void main() => runApp(const PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
      ),
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
  final List<Transaction> transactions = [];

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
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
        title: const Text('Personal Expenses'),
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
            Chart(_recentTransactions),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColor,
                elevation: 5,
                child: Text(
                  'Chart!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}
