import 'dart:convert';
import 'package:personal_expenses/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static String key = 'transactions';

  Future<List<Transaction>> loadTransactionList() async {
    final prefs = await SharedPreferences.getInstance();
    final transactionJson = prefs.getString(key);
    if (transactionJson == null) return [];
    final transactionList = jsonDecode(transactionJson)
        .map<Transaction>((transaction) => Transaction.fromMap(transaction))
        .toList();
    return transactionList;
  }

  Future<void> saveTransactionList(Transaction transactionList) async {
    final prefs = await SharedPreferences.getInstance();
    List<Transaction> test = await loadTransactionList();
    test.add(transactionList);
    final transactionJson = jsonEncode(
      test.map((transaction) => transaction.toMap()).toList(),
    );
    await prefs.setString(key, transactionJson);
  }
}
