import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/home_controller.dart';
import 'package:personal_expenses/controllers/new_transaction_controller.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Transaction()),
        // Add other providers here as needed
        Provider<NewTransactionController>(
          create: (context) => NewTransactionController(),
        ),
        Provider<HomeController>(create: (context) => HomeController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
