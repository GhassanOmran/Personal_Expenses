import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final String day;
  final double spending;
  final double spendingOfTotal;
  const Chart(
      {super.key,
      required this.spending,
      required this.spendingOfTotal,
      required this.day});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 20,
        child: Text(
          '\$${spending.toStringAsFixed(0)}',
          maxLines: 1,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 50,
        width: 10,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingOfTotal, //spending of total
              alignment: FractionalOffset.topCenter,
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
      SizedBox(
        height: 20,
        child: FittedBox(
          child: Text(day),
        ),
      ),
    ]);
  }
}
