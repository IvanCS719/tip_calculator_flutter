import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double totalAccountP;
  const ResultCard({
    super.key,
    required this.totalAccountP
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Total Cuenta'),
            Text('$totalAccountP'),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text('Total/Persona'), Text('\$0.0')],
                ),
                Column(
                  children: [Text('Total Propina'), Text('\$0.0')],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}