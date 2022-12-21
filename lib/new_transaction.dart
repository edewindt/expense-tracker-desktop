import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            Container(
                margin: const EdgeInsets.only(top: 25),
                child: TextButton(
                    onPressed: (() {
                      print(
                          '${titleController.text}, ${amountController.text}');
                    }),
                    child: const Text('Add Transaction')))
          ],
        ),
      ),
    );
  }
}
