import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/models/transactions_list.dart';
import 'package:provider/provider.dart';

class HomeController {
  final TransactionsList _transactionsList;

  HomeController(BuildContext context)
      : _transactionsList =
            Provider.of<TransactionsList>(context, listen: false);

  void add(Transaction transaction) {
    _transactionsList.add(transaction);
  }

  void remove(Transaction transaction) {
    _transactionsList.remove(transaction);
  }

  TransactionsList get transaction => _transactionsList;
}
