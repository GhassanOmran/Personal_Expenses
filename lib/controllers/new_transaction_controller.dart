import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class NewTransactionController {
  final Transaction _transaction = Transaction();

  void setTitle(String title) {
    _transaction.setTitle(title);
  }

  void setAmount(double amount) {
    _transaction.setAmount(amount);
  }

  void setDate(DateTime date) {
    print('2');
    _transaction.setDate(date);
  }

  void clearTransaction() {
    _transaction.clearTransaction();
  }

  void addTransactionToTransactionsList(BuildContext context) {
    Navigator.of(context).pop(_transaction);
  }

  Transaction get transaction => _transaction;
}
