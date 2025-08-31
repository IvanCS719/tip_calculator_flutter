import 'package:flutter/material.dart';


class TipPercentButton extends StatelessWidget {

  final int percent;
  final void Function(int) getTipPercentButton;

  const TipPercentButton({
    super.key,
    required this.percent,
    required this.getTipPercentButton
  });

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: (){
        getTipPercentButton(percent);
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        )
        
      ),
      child: Text('$percent%'),
      );
  }
}