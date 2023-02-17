// Create a model class for the transactions. Let's call it Transaction and assume it has 4 attributes: id, 
// date, description, and amount.



// class Transaction {
//   int id;
//   String date;
//   String description;
//   double amount;

//   Transaction({required this.id, required this.date, required this.description, required this.amount});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'date': date,
//       'description': description,
//       'amount': amount,
//     };
//   }

//   static Transaction fromMap(Map<String, dynamic> map) {
//     return Transaction(
//       id: map['id'],
//       date: map['date'],
//       description: map['description'],
//       amount: map['amount'],
//     );
//   }
// }
// Future<void> saveTransactions(List<Transaction> transactions) async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'transactions';
//   final value = transactions.map((t) => t.toMap()).toList();
//   prefs.setString(key, jsonEncode(value));
// }
// The toMap method is used to convert a transaction object to a map, and the fromMap method is 
// used to create a transaction object from a map.


// Future<List<Transaction>> getTransactions() async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'transactions';
//   final value = prefs.getString(key) ?? '[]';
//   final List<dynamic> json = jsonDecode(value);
//   return json.map((t) => Transaction.fromMap(t)).toList();
// }


// The saveTransactions method converts the list of transaction objects to a list of
// maps using the toMap method and then encodes
//  the list as a JSON string before saving it to the shared preferences. 
//The getTransactions method retrieves the JSON string from the shared preferences, decodes it,
//  and then converts the list of maps to a list of transaction objects using the fromMap method.

// With these two functions, you can save and retrieve a list of transactions with 4 attributes
// (id, date, description, and amount) in your Flutter app. Make sure to call saveTransactions whenever the list changes, 
//and call getTransactions when you need to display the list.