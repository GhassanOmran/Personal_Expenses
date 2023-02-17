import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/models/transactions_list.dart';

class HomeController {
  final TransactionsList transactionsList = TransactionsList();

  void add(Transaction transaction) {
    transactionsList.add(transaction);
  }

  void remove(Transaction transaction) {
    transactionsList.remove(transaction);
  }
}
