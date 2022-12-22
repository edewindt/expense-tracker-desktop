import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.add, {super.key});
  final Function add;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime date = DateTime.now();
  void submit() {
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.add(titleController.text, double.parse(amountController.text), date);

    Navigator.of(context).pop();
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
                  Text(DateFormat.yMMMd().format(date)),
                  TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2019),
                            lastDate: DateTime.now());
                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                        });
                      },
                      child: const Text('Choose Date'))
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
