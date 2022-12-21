import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_exp/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (i) {
      final weekDay = DateTime.now().subtract(Duration(days: i));
      double totalsum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          for (var tx in groupedTransactions)
            Text('${tx['day']} ${tx['amount']}')
        ],
      ),
    );
  }
}
