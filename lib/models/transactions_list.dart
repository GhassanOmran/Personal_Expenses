import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/services/shared_preferences_repository.dart';
import 'package:personal_expenses/services/sqflite_repository.dart';

class TransactionsList extends ChangeNotifier {
  late List<Transaction> transactionsList = [];
  //sharedPrefernces
  // SharedPreferencesRepository transactionsRepository =
  //     SharedPreferencesRepository();
  // Sqflite
  SqfliteRepository sqfliteRepository = SqfliteRepository();
  void add(Transaction transaction) {
    transactionsList.add(transaction);
    //sharedPrefernces
    //transactionsRepository.saveTransactionList(transaction);

    // Sqflite
    sqfliteRepository.saveTransactionList(transaction);
    notifyListeners();
  }

  void getCached() async {
    //sharedPrefernces
    //transactionsList = await transactionsRepository.loadTransactionList();

    // Sqflite
    transactionsList = (await sqfliteRepository.loadTransactionList()) ?? [];

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
