import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final num totalAccountWithTip;
  final num tipTotal;
  final num totalAccountSplitBill;

  const ResultCard(
      {super.key,
      required this.totalAccountWithTip,
      required this.tipTotal,
      required this.totalAccountSplitBill});

  @override
  Widget build(BuildContext context) {
    //final textSty = Theme.of(context).textTheme;
    final cardColor = Theme.of(context).colorScheme.primary;
    final brightness = ThemeData.estimateBrightnessForColor(cardColor);
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Card(
      color: cardColor,
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Total A Pagar',
              style: TextStyle(fontSize: 18.0, color: textColor),
            ),
            Text(
              '\$$totalAccountWithTip',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500, color: textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Divider(color: textColor.withOpacity(0.3), thickness: 2,),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Total/Persona', style: TextStyle(color: textColor)),
                    Text('\$$totalAccountSplitBill',
                        style: TextStyle(fontSize: 20.0, color: textColor))
                  ],
                ),
                Column(
                  children: [
                    Text('Total Propina', style: TextStyle(color: textColor)),
                    Text('\$$tipTotal', style: TextStyle(fontSize: 20.0, color: textColor))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
