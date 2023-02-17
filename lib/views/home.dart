import 'package:flutter/material.dart';
import 'package:personal_expenses/controllers/home_controller.dart';
import 'package:personal_expenses/views/new_transactions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List<Map<String, Object>> get groupedTransactionValues {
  //   return List.generate(7, (index) {
  //     final weekDay = DateTime.now().subtract(
  //       Duration(days: index),
  //     );
  //     var totalSum = 0.0;

  //     for (var i = 0; i < recentTransactions.length; i++) {
  //       if (recentTransactions[i].date.day == weekDay.day &&
  //           recentTransactions[i].date.month == weekDay.month &&
  //           recentTransactions[i].date.year == weekDay.year) {
  //         totalSum += recentTransactions[i].amount;
  //       }
  //     }

  //     return {
  //       'day': DateFormat.E().format(weekDay).substring(0, 1),
  //       'amount': totalSum,
  //     };
  //   }).reversed.toList();
  // }

  // double get totalSpending {
  //   return groupedTransactionValues.fold(0.0, (sum, item) {
  //     return sum + item['amount'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
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
                    // List.generate(
                    //     7,
                    //     (index) => Chart(
                    //           day: 'T',
                    //           spending: 'sp',
                    //           spendingOfTotal: 'SPo',
                    //         )),
                  ]
                  // groupedTransactionValues.map((data) {
                  //   return Flexible(
                  //     fit: FlexFit.tight,
                  //     child: ChartBar(
                  //       data['day'],
                  //       data['amount'],
                  //       totalSpending == 0.0
                  //           ? 0.0
                  //           : (data['amount'] as double) / totalSpending,
                  //     ),
                  //   );
                  // }).toList(),
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
                    builder: (_) => const NewTransaction(), context: context)
                .then((value) {
              if (value != null) {
                controller.add(value);
              }
            });
          },
          child: const Center(child: Icon(Icons.add))),
    );
  }
}
              // Chart(
              //   state: ChartState<void>(
              //       data: ChartData([
              //         [3, 5, 7, 9, 4, 3, 50]
              //             .map((e) => ChartItem<void>(e.toDouble()))
              //             .toList()
              //       ]),
              //       itemOptions: BarItemOptions(
              //         barItemBuilder: (data) {
              //           final colorForValue =
              //               Colors.accents[data.itemIndex % 15];
              //           return BarItem(
              //             radius: const BorderRadius.all(Radius.circular(50)),
              //             color: Theme.of(context).colorScheme.primary,
              //           );
              //         },
              //       )),
              // ),