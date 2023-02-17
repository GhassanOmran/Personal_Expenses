import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/new_transaction_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewTransactionController>(context);
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
                      child: Text(
                          DateFormat.yMd().format(controller.transaction.date)),
                    ),
                    TextButton(
                      onPressed: () async {
                        await showDatePicker(
                                context: context,
                                initialDate: controller.transaction.date,
                                firstDate: DateTime(2022),
                                lastDate: DateTime.now())
                            .then((value) {
                          controller.setDate(value!);
                          FocusScope.of(context).nextFocus();
                        });
                        // FocusScope.of(context).unfocus();
                      },
                      child: const Text('Choose Date'),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  controller.setTitle(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) => controller.setAmount(double.parse(value)),
              ),
              ElevatedButton(
                child: const Text('Add Transaction'),
                onPressed: () {
                  controller.addTransactionToTransactionsList(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
