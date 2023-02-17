import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionsList extends ChangeNotifier {
  final List<Transaction> transactionsList = [];

  void add(Transaction transaction) {
    transactionsList.add(transaction);
    print('add');
    notifyListeners();
  }

  void remove(Transaction transaction) {
    transactionsList.remove(transaction);
    print('remove');
    notifyListeners();
  }
}
