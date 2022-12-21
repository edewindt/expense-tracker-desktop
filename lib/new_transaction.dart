import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.add, {super.key});
  final Function add;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submit() {
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);
    add(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submit,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit,
            ),
            Container(
                margin: const EdgeInsets.only(top: 25),
                child: TextButton(
                    onPressed: submit, child: const Text('Add Transaction')))
          ],
        ),
      ),
    );
  }
}
