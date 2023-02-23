import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/home_controller.dart';
import 'package:personal_expenses/controllers/new_transaction_controller.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/models/transactions_list.dart';
import 'package:personal_expenses/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Transaction()),
        Provider<NewTransactionController>(
            create: (context) => NewTransactionController(context)),
        ChangeNotifierProvider(create: (_) => TransactionsList()),
        Provider<HomeController>(create: (context) => HomeController(context)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
