import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/models/transactions_repository.dart';

class TransactionsList extends ChangeNotifier {
  late List<Transaction> transactionsList = [];
  TransactionsRepository transactionsRepository = TransactionsRepository();
  void add(Transaction transaction) {
    transactionsList.add(transaction);
    transactionsRepository.saveTransactionList(transaction);
    notifyListeners();
  }

  void getCached() async {
    transactionsList = await transactionsRepository.loadTransactionList();
    notifyListeners();
  }

  void remove(Transaction transaction) {
    transactionsList.remove(transaction);
    notifyListeners();
  }

  static String encode(List<Transaction> transactionsList) => json.encode(
        transactionsList
            .map<Map<String, dynamic>>((transaction) => transaction.toMap())
            .toList(),
      );

  static List<Transaction> decode(String transactionsList) =>
      (json.decode(transactionsList) as List<dynamic>)
          .map<Transaction>((item) => item.fromJson())
          .toList();
}
