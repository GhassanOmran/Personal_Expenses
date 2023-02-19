import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:provider/provider.dart';

class NewTransactionController {
  Transaction _transaction;

  NewTransactionController(BuildContext context)
      : _transaction = Provider.of<Transaction>(context, listen: false);

  void setTitle(String title) {
    _transaction.setTitle(title);
  }

  void setAmount(double amount) {
    _transaction.setAmount(amount);
  }

  void setDate(DateTime date) {
    _transaction.setDate(date);
  }

  void clearTransaction() {
    _transaction = Transaction();
  }

  void addTransactionToTransactionsList(BuildContext context) {
    if (_transaction.title.toString().isNotEmpty &
        _transaction.amount.toString().isNotEmpty) {
      Navigator.of(context).pop(_transaction);
      clearTransaction();
    }
  }

  Transaction get transaction => _transaction;
}
