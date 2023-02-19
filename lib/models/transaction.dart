import 'package:flutter/material.dart';

class Transaction with ChangeNotifier {
  late String _title;
  late double _amount;
  late DateTime _date = DateTime.now();

  String get title => _title;
  double get amount => _amount;
  DateTime get date => _date;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setAmount(double amount) {
    _amount = amount;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void clearTransaction() {
    _title = '';
    _amount = 0.0;
    _date = DateTime.now();
    notifyListeners();
  }
}
