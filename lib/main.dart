import 'package:flutter/material.dart';
import 'package:personal_exp/user_transaction.dart';

void main() => runApp(const PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  const PersonalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart!'),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
