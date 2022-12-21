import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Transaction transaction in transactions)
          Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${transaction.amount}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat().add_MMMEd().format(transaction.date))
                  ],
                )
              ],
            ),
          )
      ],
    );
  }
}