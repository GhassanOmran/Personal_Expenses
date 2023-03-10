import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/controllers/home_controller.dart';
import 'package:personal_expenses/models/transactions_list.dart';
import 'package:personal_expenses/views/chart_detaits.dart';
import 'package:personal_expenses/views/new_transactions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TransactionsList>(
        builder: (context, value, child) {
          return Column(
            children: [
              Card(
                elevation: 6,
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        homeController.groupedTransactionValues.map((data) {
                      return Flexible(
                        fit: FlexFit.tight,
                        child: Chart(
                          day: data['day'],
                          spending: data['amount'],
                          spendingOfTotal: homeController.totalSpending == 0.0
                              ? 0.0
                              : (data['amount'] as double) /
                                  homeController.totalSpending,
                        ),
                      );
                    }).toList(),
                    /*
                    [
                      Column(children: <Widget>[
                        Container(
                          height: 20,
                          child: const FittedBox(
                            child: Text('Dollar'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 10,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                  color: const Color.fromRGBO(220, 220, 220, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              FractionallySizedBox(
                                //heightFactor: spendingPctOfTotal,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 20,
                          child: const FittedBox(
                            child: Text('label'),
                          ),
                        ),
                      ]),
                    ],
                 */
                  ),
                ),
              ),
              value.transactionsList.isEmpty
                  ? LayoutBuilder(builder: (ctx, constraints) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            child: const Icon(
                              Icons.refresh,
                              size: 30,
                            ),
                            onTap: () => homeController.loadData(),
                          ),
                        ],
                      );
                    })
                  : Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          children: value.transactionsList.reversed
                              .map((transaction) => Card(
                                    elevation: 5,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 5,
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                                maxLines: 1,
                                                '\$${transaction.amount.toStringAsFixed(1)}'),
                                          )),
                                      title: Text(
                                        transaction.title,
                                        maxLines: 2,
                                      ),
                                      subtitle: Text(
                                        DateFormat.yMd()
                                            .format(transaction.date),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()),
                    ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
                    builder: (_) => NewTransaction(), context: context)
                .then((value) {
              if (value != null) {
                homeController.add(value);
              }
            });
          },
          child: const Center(child: Icon(Icons.add))),
    );
  }
}
