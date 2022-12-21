import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.add, {super.key});
  final Function add;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.add(titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  void presentdatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());
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
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('No Date Chosen'),
                  TextButton(
                      onPressed: presentdatePicker, child: Text('Choose Date'))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 25),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark),
                    onPressed: submit,
                    child: const Text(
                      'Add Transaction',
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
