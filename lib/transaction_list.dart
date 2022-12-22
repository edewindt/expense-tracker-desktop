import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTx, {super.key});
  final List<Transaction> transactions;
  final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 6,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[i].amount.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[i].title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat().add_MMMEd().format(transactions[i].date))
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () => deleteTx(transactions[i].id),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
