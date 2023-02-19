import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/new_transaction_controller.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewTransactionController newTransactionController =
        Provider.of<NewTransactionController>(context, listen: false);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Consumer<Transaction>(builder: (_, model, child) {
                        return Text(DateFormat.yMd().format(model.date));
                      }),
                    ),
                    TextButton(
                      onPressed: () async {
                        DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime.now());
                        if (dateTime != null) {
                          newTransactionController.setDate(dateTime);
                        }
                      },
                      child: const Text('Choose Date'),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  newTransactionController.setTitle(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    newTransactionController.setAmount(double.parse(value)),
              ),
              ElevatedButton(
                child: const Text('Add Transaction'),
                onPressed: () {
                  newTransactionController
                      .addTransactionToTransactionsList(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
