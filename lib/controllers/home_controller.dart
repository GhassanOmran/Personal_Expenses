import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < _transactionsList.transactionsList.length; i++) {
        if (_transactionsList.transactionsList[i].date.day == weekDay.day &&
            _transactionsList.transactionsList[i].date.month == weekDay.month &&
            _transactionsList.transactionsList[i].date.year == weekDay.year) {
          totalSum += _transactionsList.transactionsList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  TransactionsList get transaction => _transactionsList;
}
